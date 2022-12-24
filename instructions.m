KbReleaseWait;
instruction = 1;

[~, ny, textbounds1, ~] = DrawFormattedText(window, 'Yonergeler (1/3)\n\nBu kisim bir deneme kismidir.\nDeneye hazir olmaniz icin tasarlanmistir.\nBurada yapmaniz gereken sey\ndeney sirasinda yapmaniz gerekenle aynidir.', 'center', 'center', [0.5 0.5 0.5]);
[~, ~, textbounds2, ~] = DrawFormattedText(window, '\nYonergeler arasinda gezinmek icin ok tuslarini kullanabilirsiniz.', 'center', ny+2*TextSize, [0.5 0.5 0.5]);


textbounds(1) = 2*fix((2*xCenter-textbounds2(3)-TextSize/2)/2); %leftborder
textbounds(2) = 2*fix((textbounds1(2)-TextSize/2)/2); %topborder
textbounds(3) = 2*fix((textbounds2(3)+TextSize)/2); %rightborder
textbounds(4) = 2*(fix((textbounds2(4)+TextSize/2)/2)-fix(TextSize/2)); %bottomborder

textbounds=CenterRectOnPointd(textbounds, xCenter, yCenter);
Screen('FillRect', window, [1 1 0], textbounds);
[~, ny, ~, ~] = DrawFormattedText(window, 'Yonergeler (1/3)\n\nBu kisim bir deneme kismidir.\nDeneye hazir olmaniz icin tasarlanmistir.\nBurada yapmaniz gereken sey\ndeney sirasinda yapmaniz gerekenle aynidir.', textbounds(1)+TextSize, textbounds(2)+TextSize, [0 0 0]);
[~, ~, ~, ~] = DrawFormattedText(window, '\nYonergeler arasinda gezinmek icin ok tuslarini kullanabilirsiniz.', textbounds(1)+TextSize, ny+1.5*TextSize, [1 0 0]);
KbReleaseWait;
Screen('Flip', window);

while 1
[keyIsDown, ~, keyCode] = KbCheck;
if keyIsDown && sum(keyCode(backforwardKeys(2))) == 1
break;
end
end


while 1
KbReleaseWait;
 if keyIsDown && sum(keyCode(backforwardKeys(1))) == 1
    if instruction > 1
        instruction = instruction-1;
    end
 end
 if keyIsDown && sum(keyCode(backforwardKeys(2))) == 1
    if instruction < 3
        instruction = instruction+1;
    end
 end
 if keyIsDown && sum(keyCode(startKey)) == 1
    if instruction == 3
        break;
    end
 end

keyIsDown=0;
if instruction == 1
[~, ny, textbounds1, ~] = DrawFormattedText(window, 'Yonergeler (1/3)\n\nBu kisim bir deneme kismidir.\nDeneye hazir olmaniz icin tasarlanmistir.\nBurada yapmaniz gereken sey\ndeney sirasinda yapmaniz gerekenle aynidir.', 'center', 'center', [0.5 0.5 0.5]);
[~, ~, textbounds2, ~] = DrawFormattedText(window, '\nYonergeler arasinda gezinmek icin ok tuslarini kullanabilirsiniz.', 'center', ny+2*TextSize, [0.5 0.5 0.5]);


textbounds(1) = 2*fix((2*xCenter-textbounds2(3)-TextSize/2)/2); %leftborder
textbounds(2) = 2*fix((textbounds1(2)-TextSize/2)/2); %topborder
textbounds(3) = 2*fix((textbounds2(3)+TextSize)/2); %rightborder
textbounds(4) = 2*(fix((textbounds2(4)+TextSize/2)/2)-fix(TextSize/2)); %bottomborder

textbounds=CenterRectOnPointd(textbounds, xCenter, yCenter);
Screen('FillRect', window, [1 1 0], textbounds);
[~, ny, ~, ~] = DrawFormattedText(window, 'Yonergeler (1/3)\n\nBu kisim bir deneme kismidir.\nDeneye hazir olmaniz icin tasarlanmistir.\nBurada yapmaniz gereken sey\ndeney sirasinda yapmaniz gerekenle aynidir.', textbounds(1)+TextSize, textbounds(2)+TextSize, [0 0 0]);
[~, ~, ~, ~] = DrawFormattedText(window, '\nYonergeler arasinda gezinmek icin ok tuslarini kullanabilirsiniz.', textbounds(1)+TextSize, ny+1.5*TextSize, [1 0 0]);
KbReleaseWait;
Screen('Flip', window);
end

if instruction == 2

   [~, ny, textbounds1, ~] = DrawFormattedText(window, 'Yonergeler (2/3)\n\nEkranda ilk once bir arti isareti (+) belirecek.\nSonrasinda ise ayni filme ait 5 klip art arda oynatilacak.\nDaha sonra karincali ekran ve sonrasinda bir arti isareti (+) gosterilecek.\nBu arti isareti (+) sonrasinda ayni filmden tek tek 10 klip oynatilacak.\nKliplerin her birinden sonra sizden cevap vermeniz beklenecek.\nBu klipler arasinda daha onceki 5''lide gordukleriniz icin "sag ok" tusunu,\ngormedikleriniz icinse "sol ok" tusunu kullanmaniz gerekmektedir.', 'center', 'center', [0.5 0.5 0.5]);
   [~, ~, textbounds2, ~] = DrawFormattedText(window, '\nYonergeler arasinda gezinmek icin ok tuslarini kullanabilirsiniz.', 'center', ny+2*TextSize, [0.5 0.5 0.5]);


textbounds(1) = 2*fix((2*xCenter-textbounds2(3)-TextSize/2)/2); %leftborder
textbounds(2) = 2*fix((textbounds1(2)-TextSize/2)/2); %topborder
textbounds(3) = 2*fix((textbounds1(3)+TextSize)/2+TextSize); %rightborder
textbounds(4) = 2*(fix((textbounds2(4)+TextSize/2)/2)-fix(TextSize/2)); %bottomborder

textbounds=CenterRectOnPointd(textbounds, xCenter, yCenter);
Screen('FillRect', window, [1 1 0], textbounds);
[~, ny, ~, ~] = DrawFormattedText(window, 'Yonergeler (2/3)\n\nEkranda ilk once bir arti isareti (+) belirecek.\nSonrasinda ise ayni filme ait 5 klip art arda oynatilacak.\nDaha sonra karincali ekran ve sonrasinda bir arti isareti (+) gosterilecek.\nBu arti isareti (+) sonrasinda ayni filmden tek tek 10 klip oynatilacak.\nKliplerin her birinden sonra sizden cevap vermeniz beklenecek.\nBu klipler arasinda daha onceki 5''lide gordukleriniz icin "sag ok" tusunu,\ngormedikleriniz icinse "sol ok" tusunu kullanmaniz gerekmektedir.', textbounds(1)+TextSize, textbounds(2)+TextSize, [0 0 0]);
[~, ~, ~, ~] = DrawFormattedText(window, '\nYonergeler arasinda gezinmek icin ok tuslarini kullanabilirsiniz.', textbounds(1)+TextSize, ny+1.5*TextSize, [1 0 0]);
KbReleaseWait;
Screen('Flip', window);
end

if instruction == 3

[~, ny, textbounds1, ~] = DrawFormattedText(window, 'Yonergeler (3/3)\n\nVerdiginiz cevabin dogrulugu kadar cevap verme hiziniz da onemlidir.\nBu yuzden olabildigince hizli cevap vermeniz gerekmektedir.', 'center', 'center', [0.5 0.5 0.5]);
[~, ~, textbounds2, ~] = DrawFormattedText(window, 'Denemeye gecmek icin lutfen', 'center', ny+2*TextSize, [0.5 0.5 0.5]);
[~, ~, ~, ~] = DrawFormattedText(window, '"bosluk"', textbounds2(3)+TextSize/2.5, ny+2*TextSize, [0.5 0.5 0.5]);
[~, ky, ~, ~] = DrawFormattedText(window, 'tusuna basiniz.', textbounds2(3)+TextSize/2.5, ny+2*TextSize, [0.5 0.5 0.5]);
[~, ~, textbounds6, ~] = DrawFormattedText(window, '\nYonergeler arasinda gezinmek icin ok tuslarini kullanabilirsiniz.', 'center', ky+.5*TextSize, [0.5 0.5 0.5]);

textbounds(1) = 2*fix((2*xCenter-textbounds1(3)-TextSize/2)/2); %leftborder
textbounds(2) = 2*fix((textbounds1(2)-TextSize/2)/2); %topborder
textbounds(3) = 2*fix((textbounds1(3)+TextSize)/2); %rightborder
textbounds(4) = 2*(fix((textbounds6(4)+TextSize/2)/2)-fix(TextSize/2)); %bottomborder

textbounds=CenterRectOnPointd(textbounds, xCenter, yCenter);
Screen('FillRect', window, [1 1 0], textbounds);
[~, ny, ~, ~] = DrawFormattedText(window, 'Yonergeler (3/3)\n\nVerdiginiz cevabin dogrulugu kadar cevap verme hiziniz da onemlidir.\nBu yuzden olabildigince hizli cevap vermeniz gerekmektedir.', textbounds(1)+TextSize, textbounds(2)+TextSize, [0 0 0]);
[nx, ~, textbounds2, ~] = DrawFormattedText(window, 'Denemeye gecmek icin lutfen', textbounds(1)+TextSize, ny+2*TextSize, [0 0 0]);
[zx, ~, textbounds3, ~] = DrawFormattedText(window, '"bosluk"', textbounds2(3)+TextSize/2.5, ny+2*TextSize, [1 0 0]);
[~, ky, textbounds5, ~] = DrawFormattedText(window, 'tusuna basiniz.', textbounds3(3)+TextSize/2.5, ny+2*TextSize, [0 0 0]);
[~, ~, ~, ~] = DrawFormattedText(window, '\nYonergeler arasinda gezinmek icin ok tuslarini kullanabilirsiniz.', textbounds(1)+TextSize, ky, [1 0 0]);
KbReleaseWait;
Screen('Flip', window);
end

while 1
[keyIsDown, ~, keyCode] = KbCheck;
if keyIsDown && ((sum(keyCode(backforwardKeys)))+sum(keyCode(startKey))) == 1
break
end
end

end
