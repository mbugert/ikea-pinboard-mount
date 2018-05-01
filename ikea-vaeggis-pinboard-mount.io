; Copyright 2018, mbugert
; 
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
; 
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
; 
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.

#! RENDER -10 -10 -10 / 10 10 10 / 8 / 4 / 1 !#
(define frame_x 2.2)
(define frame_y 2.2)
(define board_offset_front_x 0.25)
(define board_offset_back_x 0.2)

(define mount_z 4)
(define mount_t 0.4)
(define mount_clip_y 0.4)

(define hole_r 0.3)
(define hole_pos [hole_r (-(+ hole_r mount_t))])

(extrude
  (union
      (difference
        ; grip
        (offset
          (rectangle
            [0 0]
            [frame_x (+ frame_y mount_clip_y)])
          mount_t)
        ; frame + board
        (union
          (rectangle
            [board_offset_back_x 0]
            [(- frame_x board_offset_front_x) (* mount_t 10)])
          (rectangle
            [0 0]
            [frame_x frame_y])))
    ; hole (ring)
    (ring (+ hole_r mount_t) hole_r hole_pos))
0 mount_z)