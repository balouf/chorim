<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Partitions Basses Chorim - Partitions et MP3">
  <title>Partitions Basses Chorim</title>

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico">

  <!-- Styles -->
  <link rel="stylesheet" href="styles/main.css">
  <link rel="stylesheet" href="styles/player.css">
  <link rel="stylesheet" href="styles/responsive.css">

  <!-- Tone.js for time-stretch -->
  <script src="https://unpkg.com/tone@14"></script>
</head>
<body>
  <header>
    <div class="container">
      <h1>Partitions Basses Chorim</h1>
    </div>
  </header>

  <main class="container">
    <!-- Partitions Section (all PDFs) -->
    <section id="partitions" class="downloads" aria-label="Partitions">
      <h3>Partitions</h3>
      <!-- Populated by JavaScript -->
    </section>

    <!-- Player Section -->
    <section class="player-container" aria-label="Lecteur audio">
      <!-- Track Selector -->
      <nav class="track-selector" aria-label="Sélection du morceau">
        <label for="track-selector" class="sr-only">Choisir un morceau</label>
        <select id="track-selector" aria-label="Morceau">
          <!-- Populated by JavaScript -->
        </select>
      </nav>

      <!-- Loading Overlay -->
      <div id="loading-overlay" class="player-loading" style="display: none;">
        <div class="spinner"></div>
        <span>Chargement...</span>
      </div>

      <!-- Error Message -->
      <div id="error-message" class="player-error" style="display: none;"></div>

      <!-- Progress Bar -->
      <div class="progress-container">
        <div id="progress-bar" class="progress-bar" role="slider" aria-label="Position de lecture"
             aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
          <div id="progress-fill" class="progress-fill" style="width: 0%"></div>
          <div id="progress-handle" class="progress-handle" style="left: 0%"></div>
        </div>
        <div class="time-display">
          <span id="time-current">0:00</span>
          <span id="time-duration">0:00</span>
        </div>
      </div>

      <!-- Main Controls -->
      <div class="controls">
        <div class="controls-group">
          <!-- Volume Control -->
          <div class="volume-control">
            <button class="btn-control" aria-label="Volume">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"/>
                <path d="M19.07 4.93a10 10 0 0 1 0 14.14"/>
                <path d="M15.54 8.46a5 5 0 0 1 0 7.07"/>
              </svg>
            </button>
            <input type="range" id="volume-slider" min="0" max="100" value="100"
                   aria-label="Volume principal">
          </div>
        </div>

        <!-- Play Button -->
        <button id="btn-play" class="btn-play" aria-label="Play">
          <svg class="icon-play" viewBox="0 0 24 24" fill="currentColor">
            <polygon points="5 3 19 12 5 21 5 3"/>
          </svg>
          <svg class="icon-pause" viewBox="0 0 24 24" fill="currentColor">
            <rect x="6" y="4" width="4" height="16"/>
            <rect x="14" y="4" width="4" height="16"/>
          </svg>
        </button>

        <div class="controls-group">
          <!-- Tempo Control -->
          <div class="tempo-control">
            <label for="tempo-slider">Tempo</label>
            <input type="range" id="tempo-slider" min="0.25" max="2.0" value="1.0" step="0.05"
                   aria-label="Vitesse de lecture">
            <span id="tempo-value" class="tempo-value">x1.00</span>
          </div>

          <!-- Loop Button -->
          <button id="btn-loop" class="btn-control" aria-label="Activer la boucle" aria-pressed="false">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <polyline points="17 1 21 5 17 9"/>
              <path d="M3 11V9a4 4 0 0 1 4-4h14"/>
              <polyline points="7 23 3 19 7 15"/>
              <path d="M21 13v2a4 4 0 0 1-4 4H3"/>
            </svg>
          </button>
        </div>
      </div>

      <!-- MP3 Download -->
      <div id="mp3-download" class="mp3-download">
        <!-- Populated by JavaScript -->
      </div>

      <!-- Keyboard Shortcuts Help -->
      <div class="shortcuts-help">
        <strong>Raccourcis:</strong>
        <kbd>Espace</kbd> Play/Pause
        <kbd>&larr;</kbd><kbd>&rarr;</kbd> Avancer/Reculer
        <kbd>&uarr;</kbd><kbd>&darr;</kbd> Tempo
        <kbd>L</kbd> Boucle
      </div>
    </section>

    <!-- Tips Section -->
    <section class="tips">
      <h3>Conseils d'utilisation</h3>
      <ul>
        <li><strong>Tempo :</strong> Utilisez le contrôle de tempo pour ralentir les passages difficiles sans modifier la hauteur des notes.</li>
        <li><strong>Boucle :</strong> Cliquez sur le bouton boucle (<kbd>L</kbd>) pour répéter le morceau en continu.</li>
        <li><strong>Navigation :</strong> Utilisez les flèches gauche/droite pour avancer ou reculer de 5 secondes.</li>
      </ul>
    </section>
  </main>

  <footer>
    <div class="container">
      <a href="https://github.com/balouf/chorim" target="_blank" rel="noopener">
        Code source sur GitHub
      </a>
    </div>
  </footer>

  <!-- Track data (injected by deploy.py) -->
  <script>
    window.TRACKS = $tracks;
  </script>

  <!-- Application modules -->
  <script type="module" src="js/app.js"></script>
</body>
</html>
