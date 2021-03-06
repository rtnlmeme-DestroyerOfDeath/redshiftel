(defconst redshiftel-default-temp 5400)
(defconst redshiftel-min 1000)
(defconst redshiftel-max 25000)

(defconst redshiftel-step-size 100)
(defconst redshiftel-default-step-factor 1)
(defconst redshiftel-big-step-factor 6)

(defvar redshiftel-curr-temp nil)

(defun redshiftel--set-screen-temp (temp)
  "Set the screen temperature to TEMP"
  (shell-command (format "redshift -r -P -O %s" temp))
  (setq redshiftel-curr-temp temp))

(defun redshiftel-reset ()
  "Reset redshiftel screen temp"
  (interactive)
  (shell-command "redshift -x")
  (setq redshiftel-curr-temp nil))

(defun redshiftel-more-orange ()
  "Change screen temp to be a bit more orange"
  (interactive)
  (redshiftel-change '-))

(defun redshiftel-more-orange-big ()
  "Change screen temp to be way more orange. See also redshiftel-more-orange"
  (interactive)
  (redshiftel-change '- redshiftel-big-step-factor))

(defun redshiftel-more-blue ()
  "Change screen temp to be a bit more blue"
  (interactive)
  (redshiftel-change '+))

(defun redshiftel-more-blue-big ()
  "Change screen temp to be way more blue. See also redshiftel-more-blue"
  (interactive)
  (redshiftel-change '+ redshiftel-big-step-factor))

(defun redshiftel-change (op &optional factor)
  "Set screen temp and keep track of currently set screen temp.
OP should be either + or -,for more blue or more orange.
If non-nil, FACTOR should be a number to influences step size."
  (interactive)
  (setq factor (if factor factor redshiftel-default-step-factor))
  (let ((screen-temp))
    (if redshiftel-curr-temp
        (setq screen-temp (funcall op redshiftel-curr-temp (* redshiftel-step-size factor)))
      (setq screen-temp redshiftel-default-temp))
    (if (or (> screen-temp redshiftel-max) (< screen-temp redshiftel-min))
        (message "redshiftel bounds reached.")
      (redshiftel--set-screen-temp screen-temp))))
