(spacemacs|define-transient-state redshifter
  :title "Redshifter Transient State"
  :doc "
 Commands^^^^^^
----------------------------^^^^^^  ------------------------------------------^^^^^^  ------------^^
 [_j_/_n_] more orange
 [_k_/_p_] more blue
 [_x_] reset
 [_q_] quit "
  :bindings
  ("j" redshifter-more-orange)
  ("n" redshifter-more-orange)
  ("k" redshifter-more-blue)
  ("p" redshifter-more-blue)
  ("x" redshifter-reset)
  ("q" nil :exit t))

(spacemacs/set-leader-keys "oer" 'spacemacs/redshifter-transient-state/body)