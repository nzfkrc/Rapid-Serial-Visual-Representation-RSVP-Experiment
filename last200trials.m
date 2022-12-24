%son 200 klip

for trial = 1:movie_number
   
    %FIXATION CROSS
    allCoords = [-fixCrossDimPix fixCrossDimPix 0 0; 0 0 -fixCrossDimPix fixCrossDimPix];
    Screen('DrawLines', window, allCoords, lineWidthPix, grey, [xCenter yCenter], 2);
    KbReleaseWait;
    vbl = Screen('Flip',window);
    vbl = Screen('Flip', window, vbl + .2);
    
    if biononbio(trial,2) == 1
    bio_nonbio = 'bio';
    else 
    bio_nonbio = 'nonbio';
    end
    %Shuffle test clips and all clips for every movie.
    testcliporder= Shuffle(testcliporder,1);
    allclipsorder= Shuffle(allclipsorder,1);
    

    % 5 clips will be presented repeatedly.
     while 1
        if counting ~= 5 
        counting = counting + 1;
        moviefile = dir(sprintf('C:\\Users\\Psikoloji Lab\\Desktop\\RSVP\\RSVP1\\%s\\test%s', allmovies(trial,:),bio_nonbio));
        locationname = sprintf('C:\\Users\\Psikoloji Lab\\Desktop\\RSVP\\RSVP1\\%s\\test%s', allmovies(trial,:),bio_nonbio);%moviefile(testcliporder(1,counting)).folder;
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
            
            vbl = Screen('Flip', window, vbl + .4);
            vbl = Screen('Flip', window, vbl + 1);
            
            counting = 0;
            
            break;
        end
     end
     
     vbl = Screen('Flip', window);
     DrawFormattedText(window, 'Bu klipleri gordunuz mu?', 'center', 'center', [0 0 0]);
     vbl = Screen('Flip', window, vbl + .5);
     Screen('Flip', window, vbl + 2);
     
   % testclipqorder= Shuffle(testcliporder,1);
   % allclipsorder= Shuffle(allclipsorder,1);
    
        while 1
        if  counting ~= 10 
            counting = counting + 1;

            moviefile2 = dir(sprintf('C:\\Users\\Psikoloji Lab\\Desktop\\RSVP\\RSVP1\\%s\\all%s', allmovies(trial,:),bio_nonbio));
            locationname = sprintf('C:\\Users\\Psikoloji Lab\\Desktop\\RSVP\\RSVP1\\%s\\all%s', allmovies(trial,:),bio_nonbio);%moviefile2(allclipsorder(1,counting)).folder;
            clipname = moviefile2(allclipsorder(1,counting)).name;
trialnum = trialnum+1;
p.TrialData(trialnum, 1) = {p.PARTID};
p.TrialData(trialnum, 2) = {p.Age};
p.TrialData(trialnum, 3) = {p.Gender};
p.TrialData(trialnum, 4) = {p.EducationStatus};
p.TrialData(trialnum, 5) = {trialnum};
p.TrialData(trialnum, 6) = {counting};
p.TrialDataLabels = {'ID' 'Age' 'Gender' 'EducationStatus' 'Trial Order' 'Test Order in Movie' 'PresentationOrder' 'MovieType 1:blackandwhite 2:coloured' 'MovieNumber' 'ClipNumber' 'MotionType 1:biological 2:non-biological' 'StimulusType 1:target 0:distractor' 'Accuracy 1:true 0:false' 'ReactionTime' 'ExperimentNo' 'StudentNumber' 'Lecture'};
p.TrialData(trialnum, 8) = {1};
p.TrialData(trialnum, 9)= {allmovies(trial,:)};
p.TrialData(trialnum, 10)= {clipname};
p.TrialData(trialnum, 16)= {p.SchoolNumber};
p.TrialData(trialnum, 17)= {p.Lecture};

if sum(strcmp({allmovies(trial,:)},blackandwhite)) == 1
p.TrialData(trialnum, 8) = {1}; % black and white = 1
else p.TrialData(trialnum, 8) = {2}; % coloured = 2
end
            if strcmp(bio_nonbio,'bio')
               p.TrialData(trialnum, 11)= {1}; % biological = 1
            elseif strcmp(bio_nonbio,'nonbio')
               p.TrialData(trialnum, 11)= {2}; % non-biological = 2
            end
            
if sum(strcmp(clipname,targets)) == 1
newlycount = newlycount + 1;
p.TrialData(trialnum, 12)= {1}; % target
p.TrialData(trialnum, 7)= {newlycount};
elseif sum(strcmp(clipname,targets)) == 0
p.TrialData(trialnum, 12)= {2}; % distractor
p.TrialData(trialnum, 7)= {0};
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
            
            p.TrialData(trialnum, 15)= {'1'};
            
            Screen('Flip', window, 0, 1);
            
            Screen('Flip', window, [], 1);
             
            DrawFormattedText(window, 'HAYIR (SOL)                       EVET (SAG)', 'center', yCenter+128+3*TextSize, [0 0 0]);
                         
            vbl = Screen('Flip', window);

          keyIsDown=0;
          timeStart = GetSecs;
          
            while 1
              [keyIsDown, secs, keyCode] = KbCheck;
                if keyIsDown && sum(keyCode) == 1
                    if keyCode(leftKey)|| keyCode(rightKey)
                       p.TrialData(trialnum, 14) = {sprintf('%.3f',1000*(secs-timeStart))};
                        if (keyCode(rightKey) && sum(strcmp(clipname,targets)) == 1) || (keyCode(leftKey) && sum(strcmp(clipname,targets)) == 0)
                            p.TrialData(trialnum, 13)= {1}; %true
                        else
                            p.TrialData(trialnum, 13)= {0}; %fals
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
              
              DrawFormattedText(window, 'Bir sonraki denemeye devam etmek icin lutfen “Bosluk” tusuna basin.', 'center', 'center', [0 0 0]);
              Screen('Flip', window);

              counting = 0;
              
            while 1
                  [keyIsDown, secs, keyCode] = KbCheck;
                    if keyIsDown && sum(keyCode) == 1
                        if keyCode(startKey)
                            break;
                        else
                            keyIsDown=0;
                        end
                    end
            end
           
              break;
        end
        end
       newlycount = 0;
       %toolbox doesnt let you open more than 100 movies, so this function
       %closes all open movies and let us to play more.
       Screen('CloseMovie');
       
end
              
                       
vbl = Screen('Flip', window);

vbl = Screen('Flip', window, vbl + .500);
              
DrawFormattedText(window, 'Tesekkür Ederiz.', 'center', 'center', [0 0 0])
vbl = Screen('Flip', window, vbl + .500);
WaitSecs(2);

%convert .mat file to .xls file, and save to specified file location

folder2 = 'C:/Users/Psikoloji Lab/Desktop/RSVP/RSVP2/RMatFiles';
fullFileName2 = fullfile(folder2, outputname);

if ~exist(folder2, 'dir')
    mkdir(folder2);
end

save(fullFileName2,'p');

loaded = load(fullFileName2);
S = outputname;
S = S(1:end-4);

folder = 'C:/Users/Psikoloji Lab/Desktop/RSVP/RSVP1/Results';
if ~exist(folder, 'dir')
    mkdir(folder);
end
fullFileName = fullfile(folder, sprintf('%s.xls', S));

xlswrite(fullFileName,loaded.p.TrialDataLabels,1,'A1');
xlswrite(fullFileName,loaded.p.TrialData,1,'A2');

Screen('CloseAll');
sca;
              