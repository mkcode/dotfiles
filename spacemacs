;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip nil
                      auto-completion-complete-with-key-sequence "kj")
     better-defaults
     chrome
     (clojure :variables
              clojure-enable-fancify-symbols t)
     ;; (colors :variables
     ;;         colors-enable-nyan-cat-progress-bar nil
     ;;         colors-colorize-identifiers 'all)
     csv
     (dash :variables
           dash-at-point-legacy-mode t)
     emacs-lisp
     emoji
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t)
     ;; (eyebrowse :variables
                ;; eyebrowse-display-help nil)
     games
     (git :variables
          auto-revert-check-vc-info t
          evil-magit-want-horizontal-movement t
          magit-save-repository-buffers 'dontask
          magit-delete-by-moving-to-trash nil
          magit-wip-after-save-mode t
          magit-repository-directories '("~/src/projects/github" "~/src/pocket")
          vc-follow-symlinks t
          git-magit-status-fullscreen nil)
     github
     (gtags :variables
            helm-gtags-suggested-key-mapping t
            helm-gtags-prefix-key "\C-t"
            helm-gtags-pulse-at-cursor nil
            helm-gtags-display-style 'detail
            helm-gtags-fuzzy-match t
            helm-gtags-direct-helm-completing t)
     (helm :variables
           helm-follow-mode-persistent t)
     (html :variables
           web-mode-markup-indent-offset 2
           web-mode-css-indent-offset 2
           web-mode-code-indent-offset 2)
     (ibuffer :variables
              ibuffer-group-buffers-by 'projects)
     (javascript :variables
                 js-basic-offset 2
                 js2-basic-offset 2)
     lua
     markdown
     nginx
     (org :variables
          org-enable-github-support t)
     (osx :variables
          osx-dictionary-dictionary-choice (list "Dictionary" "Spanish - English" "German-English")
          osx-dictionary-separator "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n\n")
     pandoc
     plantuml
     ;; prose
     (ranger :variables
             ranger-show-literal nil)
     restclient
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-version-manager 'rbenv
           ruby-test-runner 'rspec)
     ruby-on-rails
     search-engine
     selectric
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     (shell-scripts :variables
                    sh-indentation 2)
     sql
     (spell-checking :variables
                     enable-flyspell-auto-completion nil)
     syntax-checking
     typescript
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margins t)
     vinegar
     xkcd
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(beacon)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-debug nil)
  (add-to-load-path (concat user-emacs-directory "private/monojazz/local/monojazz-theme/"))
  (require 'monojazz-theme)
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   ;; dotspacemacs-editing-style 'vim
   dotspacemacs-editing-style '(hybrid :variables
                                       hybrid-mode-enable-evilified-state t
                                       hybrid-mode-enable-hjkl-bindings t
                                       hybrid-mode-default-state 'normal)
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive nil
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monojazz)
   ;; dotspacemacs-themes '(monokai
   ;;                       zen-and-art
   ;;                       wombat
   ;;                       spacemacs
   ;;                       spacemacs-dark
   ;;                       zenburn
   ;;                       jazz)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro for Powerline"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key "C-SPC"
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "home"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.2
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; (purpose-mode -1)
  (setq evil-want-fine-undo "yes")
  ;; (setq evil-want-C-i-jump t)
  ;; (setq evil-want-C-u-scroll t)

  (setq css-indent-offset 2)
  (beacon-mode 1)
  (setq helm-follow-mode-persistent t)

  (setq ignore-window-parameters nil)


  (setq ns-use-srgb-colorspace t)
  ;; (setq powerline-default-separator 'utf-8)
  (spacemacs/toggle-mode-line-minor-modes-off)
  (spacemacs/toggle-mode-line-version-control-off)
  (spacemacs/toggle-mode-line-major-mode-on)

  (setq browse-url-generic-program "open -a safari")

  ;; Evil defines `C-e' as move-forward-one-line which is dumb. Let's grab the
  ;; smart versions of the emacs beginning and end of line functions. We need to
  ;; define C-e to override evil. C-a is not defined by evil and gets the
  ;; correct binding from the `better-defaults' layer.
  ;; (define-key evil-normal-state-map (kbd "C-a") 'mwim-beginning-of-code-or-line)
  (define-key evil-normal-state-map (kbd "C-e") 'mwim-end-of-code-or-line)
  (define-key global-map (kbd "C-9") 'flyspell-correct-previous-word-generic)

  ;; helm gtags setup
  ;; (setq helm-gtags-suggested-key-mapping nil)
  ;; (setq helm-gtags-pulse-at-cursor nil)
  ;; (setq helm-gtags-display-style 'detail)
  ;; (setq helm-gtags-fuzzy-match t)
  ;; (setq helm-gtags-maximum-candidates 5000)
  ;; (setq helm-gtags-direct-helm-completing t)

  ;; (global-unset-key (kbd "C-s"))
  ;; (define-prefix-command 'helm-gtags-map)
  ;; (define-key global-map (kbd "C-s") #'helm-gtags-map)
  ;; (define-key helm-gtags-map "c" #'helm-gtags-show-stack)
  ;; (define-key helm-gtags-map (kbd "C-c") #'helm-gtags-show-stack)
  ;; (define-key helm-gtags-map "f" #'helm-gtags-find-files)
  ;; (define-key helm-gtags-map "s" #'helm-gtags-dwim)
  ;; (define-key helm-gtags-map (kbd "C-s") #'helm-gtags-dwim)
  ;; (define-key helm-gtags-map "j" #'helm-gtags-find-tag)
  ;; (define-key helm-gtags-map "o" #'helm-gtags-find-tag-other-window)
  ;; (define-key helm-gtags-map "p" #'helm-gtags-find-pattern)
  ;; (define-key helm-gtags-map "s" #'helm-gtags-find-symbol)
  ;; (define-key helm-gtags-map "r" #'helm-gtags-find-rtag)
  ;; (define-key helm-gtags-map "t" #'helm-gtags-pop-stack)
  ;; (define-key global-map (kbd "C-t") #'helm-gtags-pop-stack)
  ;; (define-key evil-normal-state-map (kbd "C-t") #'helm-gtags-pop-stack)

  ;; ==============================================================
  ;; |                                                            |
  ;; |                  Documentation related                     |
  ;; |                                                            |
  ;; ==============================================================
  ;;
  ;;
  ;; (require 'core-documentation)
  ;;
  ;; ;; Set puml-mode vars
  ;; (let* ((plant-prefix (s-chomp (shell-command-to-string "brew --prefix plantuml")))
  ;;        (jar-path (car (file-expand-wildcards (concat plant-prefix "/*.jar")))))
  ;;   (setq puml-plantuml-jar-path jar-path)
  ;;   (setq org-plantuml-jar-path jar-path))
  ;;
  ;; (spacemacs|use-package-add-hook org
  ;;   :post-config
  ;;   ;; (setq org-babel-R-command "R --slave --no-save")
  ;;   (require 'ob-R)
  ;;   (require 'ob-plantuml)
  ;;   (add-to-list 'org-babel-load-languages '(R . t))
  ;;   (add-to-list 'org-babel-load-languages '(plantuml . t))
  ;;   (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages))
  ;;
  ;; (setq org-confirm-babel-evaluate (lambda (lang body)
  ;;                                    "Evaluate code blocks?"
  ;;                                    (if (string-equal lang "plantuml")
  ;;                                        nil
  ;;                                      t)))
  ;;
  ;; (setq org-use-sub-superscripts nil)
  ;; (setq org-export-with-sub-superscripts nil)
  ;;
  ;; (setq read-the-docs-header
  ;;   "<link rel=\"stylesheet\" type=\"text/css\" href=\"./assets/stylesheets/htmlize.css\"/>
  ;;    <link rel=\"stylesheet\" type=\"text/css\" href=\"./assets/stylesheets/readtheorg.css\"/>
  ;;    <script type=\"text/javascript\" src=\"./assets/javascripts/jquery.min.js\"></script>
  ;;    <script type=\"text/javascript\" src=\"./assets/javascripts/bootstrap.min.js\"></script>
  ;;    <script type=\"text/javascript\" src=\"./assets/javascripts/jquery.stickytableheaders.min.js\"></script>
  ;;    <script type=\"text/javascript\" src=\"./assets/javascripts/readtheorg.js\"></script>")

  ;; (setq edu-web-doc-path (expand-file-name "~/src/projects/github/education-web/doc/"))

  ;; (setq org-publish-project-alist
  ;;  `(("edu-web"
  ;;     :components ("edu-web-doc" "edu-web-doc-images"))
  ;;    ("edu-web-doc"
  ;;     :auto-sitemap t
  ;;     :sitemap-filename "index.org"
  ;;     :sitemap-title "Education-web Documentation"
  ;;     :base-directory ,edu-web-doc-path
  ;;     :base-extension "org"
  ;;     :publishing-directory ,(concat edu-web-doc-path "public/")
  ;;     :publishing-function org-html-publish-to-html
  ;;     :html-head ,read-the-docs-header
  ;;     :html-head-include-default-style nil
  ;;     :html-head-include-scripts nil)
  ;;    ("edu-web-doc-images"
  ;;     :base-directory ,(concat edu-web-doc-path "images/")
  ;;     :base-extension "png"
  ;;     :publishing-directory ,(concat edu-web-doc-path "public/images/")
  ;;     :publishing-function org-publish-attachment
  ;;     )))

  ;; (setq org-babel-default-header-args:plantuml
  ;;       '((:results . "file") (:exports . "results")
  ;;         (:output-dir . "images") (:file-ext . "png")))
  ;;
  ;; ==============================================================
  ;; |                                                            |
  ;; |                End Documentation related                   |
  ;; |                                                            |
  ;; ==============================================================


  ;; (push '(monojazz . (-100 -300)) colors-theme-identifiers-sat&light)
  ;; (setq colors-theme-identifiers-sat&light (cdr colors-theme-identifiers-sat&light))

  ;; We want indent guides and fill column indicators off. Too much noise.
  ;; (indent-guide-global-mode -1)
  ;; (spacemacs/toggle-fill-column-indicator-on)

  ;; (spacemacs/toggle-golden-ratio-off)
  (spacemacs/toggle-camel-case-motion-globally-on)

  ;; The following do not have global modes and must be setup buffer local.
  (rainbow-delimiters-mode 1)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (spacemacs/toggle-truncate-lines-on)
  (add-hook 'prog-mode-hook #'spacemacs/toggle-truncate-lines-on)
  (spacemacs/toggle-auto-fill-mode-on)
  (add-hook 'prog-mode-hook #'spacemacs/toggle-auto-fill-mode-on)


  ;; Our custom layout for education-web
  (spacemacs|define-custom-layout "edu"
    :binding "g"
    :body
    (find-file "~/src/projects/github/education-web/README.md")
    (split-window-right)
    (find-file "~/src/projects/github/education-web")
    )

  (defun edu-web-build-docs ()
    (interactive)
    (let ((edu-web-root (projectile-rails-root)))
      (async-shell-command (concat edu-web-root "script/build_docs html &"))))

  (let* ((css-dir (configuration-layer/get-layer-local-dir 'markdown))
         (gh-markdown-css-file (concat css-dir "github-markdown.css")))
    (setq markdown-css-paths (list gh-markdown-css-file)))

  (defun markdown-live-preview-window-gui-browser (filename)
    (let ((command (concat "open -a Safari " filename)))
      (async-shell-command command)))
  (setq markdown-live-preview-window-function 'markdown-live-preview-window-gui-browser)


  (defun org-preview-gfm ()
    (interactive)
    (let ((outfile (org-export-output-file-name ".md")))
      (org-export-to-file 'gfm outfile)
      (with-temp-buffer)
      ;; FIXME
      ))

  ;; (global-linum-mode -1)
  (defun only-this-buffer-linum ()
    (let ((window-list (get-buffer-window-list (current-buffer) 'no-mini 'visible)))
      (cond ((= 2 (length window-list))
             (let ((cur-window (car window-list)))
               (with-selected-window cur-window
                 (if (and (not (s-starts-with? "*" (buffer-name (window-buffer cur-window))))
                          (not (s-starts-with? " *" (buffer-name (window-buffer cur-window))))
                          (not (derived-mode-p 'dired-mode))
                          (not (window-minibuffer-p cur-window)))
                     (linum-mode +1)))))
            ((= 1 (length window-list))
             (let ((cur-window (car window-list)))
               (with-selected-window cur-window
                 (if (and (not (s-starts-with? "*" (buffer-name (window-buffer cur-window))))
                          (not (s-starts-with? " *" (buffer-name (window-buffer cur-window))))
                          (not (derived-mode-p 'dired-mode))
                          (not (window-minibuffer-p cur-window)))
                     (progn
                       (linum-mode +1)
                       (walk-windows '(lambda (win)
                                        (unless (equal win cur-window)
                                          (with-selected-window win
                                            (linum-mode -1))))
                                     'no-minibuffer 'visible)))))))))

  ;; (add-hook 'buffer-list-update-hook 'only-this-buffer-linum)
  ;; (remove-hook 'buffer-list-update-hook 'only-this-buffer-linum)

  ;; (defadvice powerline-set-selected-window (after mkcode-filter-linum-with-powerline activate)
  (defun only-this-buffer-linum-yes ()
    "only show linum mode on the current selected window"
    (walk-windows '(lambda (win)
                     (if (eq (frame-selected-window) win)
                         (with-selected-window win
                           (if (and (not (s-starts-with? "*" (buffer-name (window-buffer win))))
                                    (not (s-starts-with? " *" (buffer-name (window-buffer win))))
                                    (not (derived-mode-p 'dired-mode))
                                    (not (window-minibuffer-p win)))
                               (linum-mode +1)
                               (linum-update-window win)))
                       (with-selected-window win
                         (linum-mode -1)))) 'no-minibuffer))
  ;; (add-hook 'focus-in-hook 'only-this-buffer-linum-yes 'append)
  ;; (add-hook 'window-configuration-change-hook 'only-this-buffer-linum-yes 'append)
  ;; (defadvice select-window (after mkcode-linum-select-window activate)
  ;;  "makes powerline aware of window changes"
  ;;  (only-this-buffer-linum-yes))

  ;; (remove-hook 'focus-in-hook 'only-this-buffer-linum-yes)

  (setq-default evil-snipe-smart-case t)

  ;; Spray mode disable beacon
  (defun spray-toggle-beacon ()
    (if spray-mode
        (beacon-mode -1)
      (beacon-mode 1)))
  (add-hook 'spray-mode-hook 'spray-toggle-beacon)


  ;;Modern JS with eslint
  (spacemacs|use-package-add-hook flycheck
    :post-config
    (progn
      (flycheck-add-mode 'javascript-eslint 'js2-mode)
      (defun js2/disable-jshint ()
        (push 'javascript-jshint flycheck-disabled-checkers))
      (add-hook 'js2-mode-hook #'js2/disable-jshint)))

  ;; Override buffer-id display with a truncated version.
  (spaceline-define-segment buffer-id
    "Name of buffer."
    (let* ((st (powerline-buffer-id))
           (max-len 25)
           (right-len 6)
           (left-len (- max-len (+ 3 right-len))))
      (if (> (length st) max-len)
          (concat (s-left left-len st) "..." (s-right right-len st))
        st)))

  ;; (setq spaceline-directed-separators '(utf-8))
  ;; (setq spaceline-separator-dir-left '(left . utf-8))
  ;; (setq spaceline-separator-dir-right '(right . utf-8))

  ;; (spaceline-install
  ;; `(
  ;;   '((persp-name
  ;;      workspace-number)
  ;;     :separator " "
  ;;     :face highlight-face)
  ;;   '(buffer-modified buffer-size buffer-id-truncated remote-host)
  ;;   auto-compile
  ;;   major-mode
  ;;   ;; (((minor-modes :separator spaceline-minor-modes-separator)
  ;;   ;;   process)
  ;;   ;;  :when active)
  ;;   (erc-track :when active)
  ;;   (version-control :when active)
  ;;   (org-pomodoro :when active)
  ;;   (org-clock :when active)
  ;;   nyan-cat)

  ;; `(which-function
  ;;   (python-pyvenv :fallback python-pyenv)
  ;;   (battery :when active)
  ;;   (flycheck-error flycheck-warning flycheck-info)
  ;;   (anzu :face highlight-face)
  ;;   (selection-info :face highlight-face)
  ;;   ;; input-method
  ;;   ((point-position
  ;;     line-column)
  ;;    :separator " | ")
  ;;   (global :when active)
  ;;   buffer-position
  ;;   hud))

  ;; (setq spaceline-face-func (lambda (face active)
  ;;                             'mode-line))
  ;; (setq spaceline-face-func 'spaceline-highlight-face-default)
  ;; (defun spaceline-set-font ()
  ;;   (set-face-attribute 'mode-line nil :height 140)
  ;;   (set-face-attribute 'mode-line-inactive nil :height 140))


  (evil-define-operator evil-delete-char-blackhole (beg end type register)
    "Delete next character."
    :motion evil-forward-char
    (interactive "<R><x>")
    (unless (eq evil-want-fine-undo t)
      (evil-start-undo-step))
    (evil-delete beg end type ?_))

  (evil-define-operator evil-delete-backward-char-blackhole (beg end type register)
    "Delete next character."
    :motion evil-backward-char
    (interactive "<R><x>")
    (unless (eq evil-want-fine-undo t)
      (evil-start-undo-step))
    (evil-delete beg end type ?_))

  (define-key evil-normal-state-map "x" 'evil-delete-char-blackhole)
  (define-key evil-normal-state-map "X" 'evil-delete-backward-char-blackhole)

  (defadvice evil-insert-line (after indent-on-insert activate)
    (when evil-auto-indent
      (indent-according-to-mode)))

  ;; (defun evil-gobal-marker-p (char)
  ;;   "Whether CHAR denotes a global marker."
  ;;   t)
  ;; (defadvice evil-global-marker-p (around always-global activate)
  ;;    t)

  ;; (spacemacs/helm-gtags-define-keys-for-mode 'enh-ruby-mode)
  ;; (spacemacs/helm-gtags-define-keys-for-mode 'coffee-mode)
  (defun spacemacs/delete-window-or-frame ()
    "Calls delete-window unless there is only one window remaining, in which
  case it calls delete-frame"
    (interactive)
    (if (eq (count-windows nil) 1)
        (delete-frame)
      (delete-window)))
  (evil-leader/set-key "wd" 'spacemacs/delete-window-or-frame)

  (defun dired-find-file-without-purpose ()
    "In Dired, visit the file or directory named on this line."
    (interactive)
    ;; Bind `find-file-run-dired' so that the command works on directories
    ;; too, independent of the user's setting.
    (let ((find-file-run-dired t))
      (find-file-without-purpose (dired-get-file-for-visit))))
  ;; (define-key dired-mode-map (kbd "RET") 'dired-find-file-without-purpose)

  (setq-default dash-at-point-legacy-mode t)
  (add-to-list 'dash-at-point-mode-alist '(scss-mode . "scss"))
  ;; (spacemacs/helm-gtags-define-keys-for-mode 'coffee-mode)
  (setq-default evil-shift-width 2)
  ;; ( dired-use-ls-dired nil) ;; not needed with vinegar
  ;; (setq-default dired-listing-switches "-lah") ;; not needed with vinegar
  (add-hook 'dired-mode-hook
            '(lambda ()
               (define-key dired-mode-map (kbd "RET") 'dired-find-file-without-purpose)
               (define-key dired-mode-map (kbd "-") 'dired-up-directory)))
  ;; (define-key evil-normal-state-map (kbd "-") 'dired-jump)
  ;; (setq mac-drawing-use-gcd t)
  ;; (setq mac-mouse-wheel-smooth-scroll t)
  ;; (global-centered-cursor-mode +1)
  (evil-leader/set-key "o" 'other-window)
  (global-unset-key (kbd "C-h"))
  (global-set-key (kbd "M-?") 'help-command)
  (define-key evil-insert-state-map (kbd "C-h") 'backward-delete-char-untabify)
  (define-key global-map (kbd "C-h") 'backward-delete-char-untabify)
  (define-key global-map (kbd "C-w") 'backward-kill-word)
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "C-w") 'backward-kill-word)
    (define-key helm-map (kbd "C-h") 'backward-delete-char-untabify))
  (with-eval-after-load 'helm-swoop
    (define-key helm-swoop-map (kbd "C-w") 'backward-kill-word)
    (define-key helm-swoop-map (kbd "C-h") 'backward-delete-char-untabify))
  ;; (add-hook 'magit-mode-hook (lambda ()
  ;;                              (define-key magit-status-mode-map (kbd "-") 'magit-refresh-all)))

  ;; Emacs server related some
  (setq-default server-raise-frame t)
  (setq server-temp-file-regexp "^/var/folders/\\|^/tmp/Re\\|/draft$")
  (define-key mode-specific-map (kbd "C-c") 'server-edit)
  (add-hook 'edit-server-done-hook (lambda () (shell-command "open -a \"Google Chrome Canary\"")))

  (add-hook 'projectile-mode-hook
            '(lambda ()
               (add-to-list 'projectile-globally-ignored-directories "tmp")))

  (setq helm-swoop-use-line-number-face t)
  (setq-default popwin:popup-window-height 30)
  (setq display-buffer-base-action '((display-buffer-use-some-window)))
  (spacemacs/toggle-fullscreen-frame)
)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-source-names-using-follow nil)
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n512")))
 '(org-agenda-files
   (quote
    ("~/org/notes.org" "~/src/projects/github/education-web/TODO.org")))
 '(package-selected-packages
   (quote
    (restclient-helm ob-restclient company-restclient know-your-http-well org gh auto-complete iedit git-gutter multiple-cursors anzu undo-tree flyspell-correct ht inflections inf-ruby dash plantuml-mode insert-shebang hide-comnt helm-purpose window-purpose imenu-list async minitest smartparens magit-popup git-commit with-editor cider clojure-mode flycheck yasnippet helm helm-core magit projectile js2-mode pug-mode paradox evil-unimpaired yaml-mode xkcd ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package typit toc-org tagedit sql-indent spacemacs-theme spaceline smeargle slim-mode selectric-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restclient restart-emacs rbenv ranger rainbow-delimiters quelpa puml-mode projectile-rails popwin persp-mode pbcopy pandoc-mode pacmacs ox-pandoc ox-gfm osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file ob-http neotree mwim move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lua-mode lorem-ipsum livid-mode linum-relative link-hint less-css-mode launchctl json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode ibuffer-projectile hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gmail-message-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md ggtags flyspell-correct-helm flycheck-pos-tip flx-ido fish-mode fill-column-indicator feature-mode fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-snipe evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu enh-ruby-mode engine-mode emoji-cheat-sheet-plus emmet-mode elisp-slime-nav edit-server dumb-jump diff-hl dash-at-point csv-mode company-web company-tern company-statistics company-shell company-emoji column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby bundler beacon auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell 2048-game)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
