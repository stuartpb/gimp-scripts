(define (script-fu-export-layers img drw path)  (for-each (lambda (layer)    (let* (        (layername (car(gimp-drawable-get-name layer)))        (name (string-append layername ".png"))        (outpath (string-append path "/" name)))      (gimp-file-save RUN-NONINTERACTIVE img layer outpath name)  )) (vector->list(cadr (gimp-image-get-layers img)))))(script-fu-register  "script-fu-export-layers"  "L_ayers"  "Export all layers as individual PNG files."  "Stuart P. Bentley <stuart@testtrack4.com>"  "Copyright 2011 Stuart P. Bentley"  "June 28, 2011"  "*"  SF-IMAGE       "The Image"         0  SF-DRAWABLE    "The Layer"         0  SF-DIRNAME     "Output directory"  "")(script-fu-menu-register "script-fu-export-layers" "<Image>/File/E_xport")