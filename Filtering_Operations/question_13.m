function question_13(img, a)

%plot img
subplot(1, 3, 1)
showgrey(img)
title('Real image')

%plot img transformed with pw2img
subplot(1, 3, 2)
showgrey(pow2image(img, a))
title('chaning spectrum power')

%plot img transformed with pw2img
subplot(1, 3, 3)
showgrey(randphaseimage(img))
title('changing phase')