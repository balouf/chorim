/**
 * app.js - Main application entry point
 * Simple MP3 player for choir rehearsal
 */

import { createMP3Player, PlayerState, MP3Player } from './MP3Player.js';

/**
 * Main Application class
 */
class App {
  constructor(tracks) {
    this.tracks = tracks;
    this.currentTrackIndex = 0;

    // Player
    this.mp3Player = null;

    // Track if current track is loaded (audio context needs user interaction)
    this.trackLoaded = false;

    // DOM elements
    this.elements = {};

    // Keyboard shortcuts enabled
    this.keyboardEnabled = true;

    // Bind methods
    this.handleKeyboard = this.handleKeyboard.bind(this);
  }

  /**
   * Initialize the application
   */
  async init() {
    // Cache DOM elements
    this.cacheElements();

    // Create MP3 player
    this.mp3Player = createMP3Player();

    // Setup event listeners
    this.setupEventListeners();
    this.setupPlayerListeners();

    // Setup keyboard shortcuts
    document.addEventListener('keydown', this.handleKeyboard);

    // Render track selector
    this.renderTrackSelector();

    // Render all partitions (PDFs)
    this.renderAllPartitions();

    // Setup initial track UI (but don't load audio yet - needs user interaction)
    if (this.tracks.length > 0) {
      const track = this.tracks[0];
      this.renderMP3Download(track);
    }

    console.log('App initialized');
  }

  /**
   * Cache DOM elements
   */
  cacheElements() {
    this.elements = {
      trackSelector: document.getElementById('track-selector'),
      playBtn: document.getElementById('btn-play'),
      progressBar: document.getElementById('progress-bar'),
      progressFill: document.getElementById('progress-fill'),
      progressHandle: document.getElementById('progress-handle'),
      timeDisplay: document.getElementById('time-current'),
      durationDisplay: document.getElementById('time-duration'),
      tempoSlider: document.getElementById('tempo-slider'),
      tempoValue: document.getElementById('tempo-value'),
      volumeSlider: document.getElementById('volume-slider'),
      loopBtn: document.getElementById('btn-loop'),
      partitions: document.getElementById('partitions'),
      mp3Download: document.getElementById('mp3-download'),
      loadingOverlay: document.getElementById('loading-overlay'),
      errorMessage: document.getElementById('error-message')
    };
  }

  /**
   * Setup UI event listeners
   */
  setupEventListeners() {
    // Track selector
    if (this.elements.trackSelector) {
      this.elements.trackSelector.addEventListener('change', (e) => {
        this.selectTrack(parseInt(e.target.value, 10));
      });
    }

    // Play button
    if (this.elements.playBtn) {
      this.elements.playBtn.addEventListener('click', () => {
        this.togglePlay();
      });
    }

    // Progress bar
    if (this.elements.progressBar) {
      this.elements.progressBar.addEventListener('click', (e) => {
        this.seekFromEvent(e);
      });

      // Drag support
      let isDragging = false;
      this.elements.progressBar.addEventListener('mousedown', () => { isDragging = true; });
      document.addEventListener('mouseup', () => { isDragging = false; });
      document.addEventListener('mousemove', (e) => {
        if (isDragging) this.seekFromEvent(e);
      });

      // Touch support
      this.elements.progressBar.addEventListener('touchstart', (e) => {
        this.seekFromEvent(e.touches[0]);
      });
      this.elements.progressBar.addEventListener('touchmove', (e) => {
        e.preventDefault();
        this.seekFromEvent(e.touches[0]);
      });
    }

    // Tempo slider
    if (this.elements.tempoSlider) {
      this.elements.tempoSlider.addEventListener('input', (e) => {
        const tempo = parseFloat(e.target.value);
        this.setTempo(tempo);
      });
    }

    // Volume slider
    if (this.elements.volumeSlider) {
      this.elements.volumeSlider.addEventListener('input', (e) => {
        const volume = parseFloat(e.target.value) / 100;
        this.setMasterVolume(volume);
      });
    }

    // Loop button
    if (this.elements.loopBtn) {
      this.elements.loopBtn.addEventListener('click', () => {
        this.toggleLoop();
      });
    }
  }

  /**
   * Setup player event listeners
   */
  setupPlayerListeners() {
    this.mp3Player.on('loaded', ({ duration }) => {
      this.updateDuration(duration);
      this.hideLoading();
    });

    this.mp3Player.on('statechange', (state) => {
      this.updatePlayButton(state);
    });

    this.mp3Player.on('timeupdate', ({ currentTime, duration }) => {
      this.updateProgress(currentTime, duration);
    });

    this.mp3Player.on('tempochange', (tempo) => {
      this.updateTempoDisplay(tempo);
    });

    this.mp3Player.on('loopchange', ({ enabled }) => {
      this.updateLoopButton(enabled);
    });

    this.mp3Player.on('error', (error) => {
      this.showError(error.message);
    });
  }

  /**
   * Render track selector dropdown
   */
  renderTrackSelector() {
    if (!this.elements.trackSelector) return;

    this.elements.trackSelector.innerHTML = this.tracks.map((track, i) =>
      `<option value="${i}">${track.name}</option>`
    ).join('');
  }

  /**
   * Select a track
   */
  async selectTrack(index) {
    if (index < 0 || index >= this.tracks.length) return;

    // Stop current playback
    this.mp3Player.stop();
    this.trackLoaded = false;

    this.currentTrackIndex = index;
    const track = this.tracks[index];

    // Update selector
    if (this.elements.trackSelector) {
      this.elements.trackSelector.value = index;
    }

    // Update MP3 download link
    this.renderMP3Download(track);

    // Load the track
    this.showLoading();

    try {
      // Use track.file for audio files (supports multi-output LilyPond files)
      const basePath = `${track.path}/${track.file || track.path}`;
      await this.mp3Player.load(`${basePath}.mp3`);
      this.trackLoaded = true;
    } catch (error) {
      this.showError(`Erreur de chargement: ${error.message}`);
    }
  }

  /**
   * Load current track if not already loaded
   */
  async ensureTrackLoaded() {
    if (this.trackLoaded) return true;
    await this.selectTrack(this.currentTrackIndex);
    return this.trackLoaded;
  }

  /**
   * Toggle play/pause
   */
  async togglePlay() {
    // Load track on first interaction (audio context needs user gesture)
    if (!this.trackLoaded) {
      await this.ensureTrackLoaded();
      if (!this.trackLoaded) return;
    }
    this.mp3Player.togglePlay();
  }

  /**
   * Seek from mouse/touch event
   */
  seekFromEvent(event) {
    if (!this.elements.progressBar || !this.trackLoaded) return;

    const rect = this.elements.progressBar.getBoundingClientRect();
    const x = (event.clientX || event.pageX) - rect.left;
    const progress = Math.max(0, Math.min(1, x / rect.width));

    this.mp3Player.seek(progress);
  }

  /**
   * Set tempo
   */
  setTempo(tempo) {
    this.mp3Player.setTempo(tempo);
  }

  /**
   * Set master volume
   */
  setMasterVolume(volume) {
    this.mp3Player.setVolume(volume);
  }

  /**
   * Toggle loop
   */
  toggleLoop() {
    this.mp3Player.toggleLoop();
  }

  /**
   * Render all partitions (PDFs) - grouped by source file with iframe preview
   */
  renderAllPartitions() {
    if (!this.elements.partitions) return;

    // Group tracks by path to get unique PDF sets
    const pdfsByPath = new Map();
    for (const track of this.tracks) {
      if (!pdfsByPath.has(track.path)) {
        // Extract base title by removing any suffix like " - 1-Fortuna"
        const baseTitle = track.name.includes(' - ') && track.file !== track.path
          ? track.name.substring(0, track.name.lastIndexOf(' - '))
          : track.name;
        pdfsByPath.set(track.path, { title: baseTitle, pdfs: track.pdfs });
      }
    }

    // Build list of all PDFs with their paths and labels
    const allPdfs = [];
    const sortedEntries = [...pdfsByPath.entries()].sort((a, b) =>
      a[1].title.localeCompare(b[1].title)
    );

    for (const [path, { title, pdfs }] of sortedEntries) {
      if (pdfs) {
        for (const suffix of pdfs) {
          const pdfPath = `${path}/${path}${suffix}.pdf`;
          const suffixLabel = suffix ? ` (${suffix.replace('-', '')})` : '';
          allPdfs.push({ path: pdfPath, label: `${title}${suffixLabel}` });
        }
      }
    }

    if (allPdfs.length === 0) {
      this.elements.partitions.innerHTML = '<h3>Partitions</h3><p>Aucune partition disponible</p>';
      return;
    }

    // Build select options
    const options = allPdfs.map((pdf, i) =>
      `<option value="${pdf.path}">${pdf.label}</option>`
    ).join('');

    const firstPdf = allPdfs[0].path;

    const html = `
      <h3>Partitions</h3>
      <div class="pdf-controls">
        <select id="pdf-selector">${options}</select>
        <a id="pdf-download" href="${firstPdf}" download class="btn btn-secondary">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
            <polyline points="7 10 12 15 17 10"/>
            <line x1="12" y1="15" x2="12" y2="3"/>
          </svg>
          Télécharger
        </a>
        <button id="pdf-fullscreen" class="btn btn-secondary" title="Plein écran">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <polyline points="15 3 21 3 21 9"/>
            <polyline points="9 21 3 21 3 15"/>
            <line x1="21" y1="3" x2="14" y2="10"/>
            <line x1="3" y1="21" x2="10" y2="14"/>
          </svg>
        </button>
      </div>
      <iframe id="pdf-viewer" class="pdf-viewer" src="${firstPdf}"></iframe>
    `;

    this.elements.partitions.innerHTML = html;

    // Setup event listeners
    const pdfSelector = document.getElementById('pdf-selector');
    const pdfViewer = document.getElementById('pdf-viewer');
    const pdfDownload = document.getElementById('pdf-download');
    const pdfFullscreen = document.getElementById('pdf-fullscreen');

    if (pdfSelector && pdfViewer && pdfDownload) {
      pdfSelector.addEventListener('change', (e) => {
        const selectedPdf = e.target.value;
        pdfViewer.src = selectedPdf;
        pdfDownload.href = selectedPdf;
      });
    }

    if (pdfFullscreen && pdfViewer) {
      pdfFullscreen.addEventListener('click', () => {
        if (pdfViewer.requestFullscreen) {
          pdfViewer.requestFullscreen();
        } else if (pdfViewer.webkitRequestFullscreen) {
          pdfViewer.webkitRequestFullscreen();
        }
      });
    }
  }

  /**
   * Render MP3 download link for current track
   */
  renderMP3Download(track) {
    if (!this.elements.mp3Download) return;

    const audioBasePath = `${track.path}/${track.file || track.path}`;

    const html = `<a href="${audioBasePath}.mp3" target="_blank" class="mp3-link">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
        <polyline points="7 10 12 15 17 10"/>
        <line x1="12" y1="15" x2="12" y2="3"/>
      </svg>
      Télécharger MP3
    </a>`;

    this.elements.mp3Download.innerHTML = html;
  }

  /**
   * Update progress bar and time displays
   */
  updateProgress(currentTime, duration) {
    const progress = duration > 0 ? currentTime / duration : 0;

    if (this.elements.progressFill) {
      this.elements.progressFill.style.width = `${progress * 100}%`;
    }

    if (this.elements.progressHandle) {
      this.elements.progressHandle.style.left = `${progress * 100}%`;
    }

    if (this.elements.timeDisplay) {
      this.elements.timeDisplay.textContent = MP3Player.formatTime(currentTime);
    }
  }

  /**
   * Update duration display
   */
  updateDuration(duration) {
    if (this.elements.durationDisplay) {
      this.elements.durationDisplay.textContent = MP3Player.formatTime(duration);
    }
  }

  /**
   * Update play button state
   */
  updatePlayButton(state) {
    if (!this.elements.playBtn) return;

    const isPlaying = state === PlayerState.PLAYING;
    this.elements.playBtn.classList.toggle('playing', isPlaying);
    this.elements.playBtn.setAttribute('aria-label', isPlaying ? 'Pause' : 'Play');
  }

  /**
   * Update tempo display
   */
  updateTempoDisplay(tempo) {
    if (this.elements.tempoSlider) {
      this.elements.tempoSlider.value = tempo;
    }

    if (this.elements.tempoValue) {
      this.elements.tempoValue.textContent = `x${tempo.toFixed(2)}`;
    }
  }

  /**
   * Update loop button state
   */
  updateLoopButton(enabled) {
    if (!this.elements.loopBtn) return;
    this.elements.loopBtn.classList.toggle('active', enabled);
    this.elements.loopBtn.setAttribute('aria-pressed', enabled);
  }

  /**
   * Show loading overlay
   */
  showLoading() {
    if (this.elements.loadingOverlay) {
      this.elements.loadingOverlay.style.display = 'flex';
    }
  }

  /**
   * Hide loading overlay
   */
  hideLoading() {
    if (this.elements.loadingOverlay) {
      this.elements.loadingOverlay.style.display = 'none';
    }
  }

  /**
   * Show error message
   */
  showError(message) {
    this.hideLoading();
    if (this.elements.errorMessage) {
      this.elements.errorMessage.textContent = message;
      this.elements.errorMessage.style.display = 'block';
    }
    console.error(message);
  }

  /**
   * Handle keyboard shortcuts
   */
  async handleKeyboard(e) {
    if (!this.keyboardEnabled) return;

    // Ignore if typing in an input
    if (e.target.tagName === 'INPUT' || e.target.tagName === 'SELECT' || e.target.tagName === 'TEXTAREA') {
      return;
    }

    switch (e.code) {
      case 'Space':
        e.preventDefault();
        this.togglePlay();
        break;

      case 'ArrowLeft':
        e.preventDefault();
        if (!this.trackLoaded) return;
        this.mp3Player.seek(Math.max(0, this.mp3Player.currentTime - 5), true);
        break;

      case 'ArrowRight':
        e.preventDefault();
        if (!this.trackLoaded) return;
        this.mp3Player.seek(this.mp3Player.currentTime + 5, true);
        break;

      case 'ArrowUp':
        e.preventDefault();
        if (!this.trackLoaded) return;
        this.setTempo(Math.min(2.0, this.mp3Player.tempo + 0.05));
        break;

      case 'ArrowDown':
        e.preventDefault();
        if (!this.trackLoaded) return;
        this.setTempo(Math.max(0.25, this.mp3Player.tempo - 0.05));
        break;

      case 'KeyL':
        if (!this.trackLoaded) return;
        this.toggleLoop();
        break;

      case 'Home':
        e.preventDefault();
        if (!this.trackLoaded) return;
        this.mp3Player.seek(0);
        break;

      case 'End':
        e.preventDefault();
        if (!this.trackLoaded) return;
        this.mp3Player.seek(1);
        break;
    }
  }

  /**
   * Cleanup
   */
  dispose() {
    document.removeEventListener('keydown', this.handleKeyboard);

    if (this.mp3Player) this.mp3Player.dispose();
  }
}

// Export for use
export { App };

// Auto-initialize if tracks data is available
document.addEventListener('DOMContentLoaded', () => {
  // Check if tracks data is defined (will be injected by template)
  if (typeof window.TRACKS !== 'undefined') {
    const app = new App(window.TRACKS);
    app.init().catch(console.error);

    // Expose app for debugging
    window.app = app;
  }
});

export default App;
