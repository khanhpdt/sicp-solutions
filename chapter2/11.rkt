#lang planet neil/sicp

(define (mul-interval-2 x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond ((and (< ux 0) (< uy 0)) (make-interval (* ux uy)
                                                  (* lx ly)))
          ((and (< ux 0) (>= uy 0) (< ly 0)) (make-interval (* lx uy)
                                                            (* lx ly)))
          ((and (< ux 0) (>= uy 0) (>= ly 0)) (make-interval (* lx uy)
                                                             (* ux ly)))
          ((and (>= ux 0) (< lx 0) (< uy 0)) (make-interval (* ux ly)
                                                            (* lx ly)))
          ((and (>= ux 0) (< lx 0) (>= uy 0) (< ly 0)) (make-interval (min (* lx uy) (* ux ly))
                                                                      (max (* lx ly) (* ux uy))))
          ((and (>= ux 0) (< lx 0) (>= uy 0) (>= ly 0)) (make-interval (* lx uy)
                                                                       (* ux uy)))
          ((and (>= ux 0) (>= lx 0) (< uy 0)) (make-interval (* ux ly)
                                                             (* lx uy)))
          ((and (>= ux 0) (>= lx 0) (>= uy 0) (< ly 0)) (make-interval (* ux ly)
                                                                       (* ux uy)))
          ((and (>= ux 0) (>= lx 0) (>= uy 0) (>= ly 0)) (make-interval (* lx ly)
                                                                        (* ux uy))))))