%ilk 200 klip
Screen('TextStyle', window,1);
for trial = 1:10
   
    %FIXATION CROSS
    allCoords = [-fixCrossDimPix fixCrossDimPix 0 0; 0 0 -fixCrossDimPix fixCrossDimPix];
    Screen('DrawLines', window, allCoords, lineWidthPix, grey, [xCenter yCenter], 2);
    KbReleaseWait;
    vbl = Screen('Flip',window);
    vbl = Screen('Flip', window, vbl + .2);
    
    %Since the scenes from practicemovie are selected as only biological
    %motions...
    bio_nonbio = 'bio';
    
    %Shuffle test clips and all clips for every movie.
    testcliporder= Shuffle(testcliporder,1);
    allclipsorder= Shuffle(allclipsorder,1);
    

    % 5 clips will be presented repeatedly.
     while 1
        if counting ~= 5 
        counting = counting + 1;
        moviefile = dir(sprintf('C:\\Users\\Psikoloji Lab\\Desktop\\RSVP\\RSVP1\\practicemovie\\test%s',bio_nonbio));
        locationname = sprintf('C:\\Users\\Psikoloji Lab\\Desktop\\RSVP\\RSVP1\\practicemovie\\test%s',bio_nonbio);
        clipname = moviefile(testcliporder(1,counting)).name;
        targets(counting,1) = {clipname};
        necessarycombine = strcat(locationname, '\', clipname);
    
        playing_clips = Screen('OpenMovie', window, necessarycombine);            
        Screen('PlayMovie', playing_clips, 1);
        
        %Show the movie clip.
        
           while 1
           % Wait for next movie frame, retrieve texture handle to it
           tex = Screen('GetMovieImage', window, playing_clips);
           % Valid texture returned? A negative value means end of movie reached:
           if tex<=0
                % We're done, break out of loop:
               break;
           end
            % Draw the new texture immediately to screen:
            Screen('DrawTexture', window, tex);
            % Update display:
            Screen('Flip', window);
            % Release texture:
            Screen('Close', tex);
            %end
           end
           
        else
            theImage = imread('TheImage.jpg');
            %Create a texture with the image
            imageTexture = Screen('MakeTexture',window, theImage);
            %Draw the texture
            Screen('DrawTexture', window, imageTexture);
            vbl = Screen('Flip', window);

                        
            counting = 0;

            vbl = Screen('Flip', window, vbl + .4);
            vbl = Screen('Flip', window, vbl + 1);
          
            break;
        end
     end
     
   % testclipqorder= Shuffle(testcliporder,1);
   % allclipsorder= Shuffle(allclipsorder,1);
    
        endpractice=0;
            while endpractice == 0 
        if  counting ~= 10 
            counting = counting + 1;

            moviefile2 = dir(sprintf('C:\\Users\\Psikoloji Lab\\Desktop\\RSVP\\RSVP1\\practicemovie\\all%s',bio_nonbio));
            locationname = sprintf('C:\\Users\\Psikoloji Lab\\Desktop\\RSVP\\RSVP1\\practicemovie\\all%s',bio_nonbio);
            clipname = moviefile2(allclipsorder(1,counting)).name;
trialnum = trialnum+1;
p.PracticeData(trialnum, 1) = {p.PARTID};
p.PracticeData(trialnum, 2) = {trialnum};
p.PracticeData(trialnum, 3) = {counting};
p.PracticeDataLabels = {'ID' 'TrialOrder' 'ClipOrder' 'MovieType' 'MovieNumber' 'ClipNumber' 'MotionType' 'StimulusType' 'Accuracy' 'ReactionTime' 'VAI'};
%since practicemovie is coloured...
p.PracticeData(trialnum, 4) = {'coloured'};
p.PracticeData(trialnum, 5)= {allmovies(trial,:)};
p.PracticeData(trialnum, 6)= {clipname};
p.PracticeData(trialnum, 7)= {p.SchoolNumber};


%Since the scenes from practicemovie are selected as only biological
    %motions...
p.PracticeData(trialnum, 7)= {'biological'};
            
if sum(strcmp(clipname,targets)) == 1
p.PracticeData(trialnum, 8)= {'target'};
elseif sum(strcmp(clipname,targets)) == 0
p.PracticeData(trialnum, 8)= {'distractor'};
end


            necessarycombine = strcat(locationname, '\', clipname);
                
                %read frames and evaluate
                frames = mmread(necessarycombine);
                first_frames = frames.frames(1);
                first_frames = first_frames.cdata;
                last_frames = frames.frames(end);
                last_frames = last_frames.cdata;
                %frameVAI= corr2(rgb2gray(first_frames), rgb2gray(last_frames));
            
            %vbl = Screen('Flip', window);
            
            [playing_clips, movie, movieduration, fps, imgw, imgh]= Screen('OpenMovie', window, necessarycombine);
            
            Screen('PlayMovie', playing_clips, 1);
            
            %Show the movie clip

            while 1
           % Wait for next movie frame, retrieve texture handle to it
              tex = Screen('GetMovieImage', window, playing_clips);
           % Valid texture returned? A negative value means end of movie reached:
                if tex<=0
                    % We're done, break out of loop:
                   break;
                end
                % Draw the new texture immediately to screen:
                Screen('DrawTexture', window, tex);
                % Update display:
                Screen('Flip', window, 0, 1);
                % Release texture:
                Screen('Close', tex);
            end            
            %v = VideoReader(necessarycombine);
            %frames = readFrame(v);
            
            %p.PracticeData(trialnum, 11)= {sprintf('%.3f',frameVAI)};
            
            Screen('Flip', window, 0, 1);
            
            Screen('Flip', window, [], 1);
            DrawFormattedText(window, 'Bu klibi az once gormus muydunuz?', 'center', yCenter-128-3*TextSize, [0 0 0]);
                 
            DrawFormattedText(window, 'HAYIR (SOL)                   EVET (SAG)', 'center', yCenter+128+3*TextSize, [0 0 0]);
                         
            Screen('Flip', window);

          keyIsDown=0;
          timeStart = GetSecs;
          
            while 1
              [keyIsDown, secs, keyCode] = KbCheck;
                if keyIsDown && sum(keyCode) == 1
                    if keyCode(leftKey)|| keyCode(rightKey)
                       p.PracticeData(trialnum, 10) = {sprintf('%.3f',1000*(secs-timeStart))};
                        if (keyCode(rightKey) && sum(strcmp(clipname,targets)) == 1) || (keyCode(leftKey) && sum(strcmp(clipname,targets)) == 0)
                            p.PracticeData(trialnum, 9)= {1}; %true
                            if keyCode(rightKey)
                                correct_key = 'Evet (Sag Ok Tusu)';
                                msg = sprintf('%s cevabiniz dogru!',correct_key);
                            elseif keyCode(leftKey)
                                correct_key = 'Hayir (Sol Ok Tusu)';
                                msg = sprintf('%s cevabiniz dogru!',correct_key);
                            end
                            vbl = Screen('Flip', window);
                            DrawFormattedText(window, msg, 'center', 'center', [0 1 0]);
                            vbl = Screen('Flip', window, vbl + .5);
                            Screen('Flip', window, vbl + 2);
                        else
                            p.PracticeData(trialnum, 9)= {0}; %false
                            if keyCode(rightKey)
                                 correct_key = double('Evet (Sag Ok Tusu)');
                                 msg = sprintf('%s cevabiniz yanlis! Dogru cevap Hayir (Sol Ok Tusu) idi.',correct_key);
                            elseif keyCode(leftKey)
                                 correct_key = 'Hayir (Sol Ok Tusu)';
                                 msg = sprintf('%s cevabiniz yanlis! Dogru cevap Evet (Sag Ok Tusu) idi.',correct_key);
                            end
                            vbl = Screen('Flip', window);
                            DrawFormattedText(window, msg, 'center', 'center', [1 0 0]);
                            vbl = Screen('Flip', window, vbl + .5);
                            Screen('Flip', window, vbl + 2);
                        end
                        break;
                    elseif keyCode(quitKey)
                        sca;
                        break;
                    else
                        keyIsDown=0;
                    end
                end
            end    
            
            KbReleaseWait;
            vbl = Screen('Flip', window);
            Screen('Flip', window, vbl + .500);
        else  
  
              vbl = Screen('Flip', window);
              
              Screen('Flip', window, vbl + .500);
              
              DrawFormattedText(window, 'Tekrar deneme yapmak icin "enter" tusuna,\n\nGercek deneye geçmek için lütfen "bosluk" tusuna basin.', 'center', 'center', [0 0 0]);
              Screen('Flip', window);

              counting = 0;
              
            while endpractice == 0 
                  [keyIsDown, secs, keyCode] = KbCheck;
                    if keyIsDown && sum(keyCode) == 1
                        if keyCode(enterKey)
                            break;
                        elseif keyCode(startKey)
                            endpractice = 1;   
                         break;
                            
                        else
                            keyIsDown=0;
                        end
                    end
            end
           
              break;
if endpractice == 1;   
    break;
end
        end   
        end
        
       %toolbox doesnt let you open more than 100 movies, so this function
       %closes all open movies and let us to play more.
       Screen('CloseMovie');
if endpractice == 1;   
    break;
end
end
