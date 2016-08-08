function [Y, lbls, Ytest, lblstest] = lvmLoadData(dataset, seedVal)

% LVMLOADDATA Load a latent variable model dataset.
%
%	Description:
%
%	[Y, LBLS, YTEST, LBLSTEST] = LVMLOADDATA(DATASET) loads a data set
%	for a latent variable modelling problem.
%	 Returns:
%	  Y - the training data loaded in.
%	  LBLS - a set of labels for the data (if there are no labels it is
%	   empty).
%	  YTEST - the test data loaded in. If no test set is available it is
%	   empty.
%	  LBLSTEST - a set of labels for the test data (if there are no
%	   labels it is empty).
%	 Arguments:
%	  DATASET - the name of the data set to be loaded. Currently the
%	   possible names are 'robotWireless', 'robotWirelessTest',
%	   'robotTwoLoops', 'robotTraces', 'robotTracesTest', 'cmu35gplvm',
%	   'cmu35Taylor', 'cmu35walkJog', 'vowels', 'stick', 'brendan',
%	   'digits', 'twos', 'oil', 'oilTest', 'oilValid', 'oil100',
%	   'swissRoll'.
%	
%
%	See also
%	MAPLOADDATA, DATASETSDIRECTORY


%	Copyright (c) 2004, 2005, 2006, 2008 Neil D. Lawrence
% 	lvmLoadData.m CVS version 1.9
% 	lvmLoadData.m SVN version 176
% 	last update 2009-01-06T11:52:58.224584Z

  if nargin > 1
    randn('seed', seedVal)
    rand('seed', seedVal)
  end

  % get directory

  baseDir = datasetsDirectory;
  dirSep = filesep;
  lbls = [];
  lblstest = [];
  switch dataset
   case 'movielens'
    try 
      load([baseDir 'movielens.mat']);
    catch
      [void, errid] = lasterr;
      if strcmp(errid, 'MATLAB:load:couldNotReadFile');
        fileName = [baseDir dirSep 'movielens' dirSep 'large' dirSep 'ratings.dat'];
        [users, films, ratings, timeStamp] = textread(fileName, '%n::%n::%n::%n');
        ind = randperm(size(users, 1));
        users = users(ind, :);
        films = films(ind, :);
        ratings = ratings(ind, :);
        numUsers = max(users);
        numFilms = max(films);
        
        numRatings = size(users, 1);
        numTrainRatings = ceil(0.8*numRatings);
        Y = spalloc(numFilms, numUsers, numTrainRatings);
        Ytest = spalloc(numFilms, numUsers, numRatings-numTrainRatings);
        indTrain = sub2ind(size(Y), films(1:numTrainRatings), users(1:numTrainRatings));
        indTest = sub2ind(size(Ytest), films(numTrainRatings+1:numRatings), users(numTrainRatings+1:numRatings));
        Y(indTrain) = ratings(1:numTrainRatings);
        Ytest(indTest) = ratings(numTrainRatings+1:numRatings);
        save([baseDir 'movielens.mat'], 'Y', 'lbls', 'Ytest', 'lblstest');
      else
        error(lasterr);
      end
    end
      
   case {'movielensSmall1', 'movielensSmall2', 'movielensSmall3', 'movielensSmall4', 'movielensSmall5'}

    partNo = str2num(dataset(end));
    uTrain = load([baseDir dirSep 'movielens' dirSep 'small' dirSep 'u' num2str(partNo) '.base']);
    numUsers = max(uTrain(:, 1));
    numFilms = max(uTrain(:, 2));
    numRatings = size(uTrain, 1);
    Y = spalloc(numFilms, numUsers, numRatings);
    
    for i = 1:size(uTrain, 1);
      Y(uTrain(i, 2), uTrain(i, 1)) = uTrain(i, 3);
    end
    meanY = mean(Y(find(Y)));
    Y(find(Y)) = (Y(find(Y))-meanY);
    
    uTest = load([baseDir dirSep 'movielens' dirSep 'small' dirSep 'u' num2str(partNo) '.test']);
    numTestRatings = size(uTest, 1);
    Ytest = spalloc(numFilms, numUsers, numTestRatings);
    for i = 1:size(uTest, 1);
      Ytest(uTest(i, 2), uTest(i, 1)) = uTest(i, 3);
    end
    Ytest(find(Ytest)) = (Ytest(find(Ytest))-meanY);
    stdY = sqrt(var(Y(find(Y))));
    Y = Y/stdY;
    Ytest = Ytest/stdY;
    
   case 'crabs'
    fid = fopen([baseDir 'crabs.dat']);
    if fid == -1
      error(['No such file name ' fileName])
    end
    readLine = fgets(fid);
    counter = 0;
    data = [];
    while readLine ~= -1
      readLine = fgets(fid);
      counter = counter + 1;
      parts = stringSplit(readLine, ' ');
      if parts{1} == 'B' && parts{2} == 'F'
        lbls(counter, :) = [0 0 0 1];
      elseif parts{1} == 'B' && parts{2} == 'M'
        lbls(counter, :) = [0 0 1 0];
      elseif parts{1} == 'O' && parts{2} == 'F'
        lbls(counter, :) = [0 1 0 0];
      else
        lbls(counter, :) = [1 0 0 0];
      end
      counter2 = 0;
      for i = 3:size(parts, 2)
        if ~isempty(str2num(parts{i}))
          counter2 = counter2 + 1;
          data(counter, counter2) = str2num(parts{i});
        end
      end
    end
    data = data(:, 2:end);
    Y = data./repmat(sum(data, 2), 1, size(data, 2));
    
   case 'spellman'
    fileName = ([baseDir 'combined.txt']);
    [geneName, ...
     y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, ...
     y13, y14, y15, y16, y17, y18, y19, y20, y21, y22, y23, y24] = ...
        textread(fileName, '%q %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', ...
                 'headerlines', 1, 'whitespace', '', 'delimiter', '\t');
    
    Y = [y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11 y12 y13 y14 y15 y16 y17 y18 y19 y20 y21 y22 y23 y24]';
    
   case 'robotWireless'
    Y = parseWirelessData([baseDir 'uw-floor.txt']);
    Y = Y(1:215, :);
    
   case 'robotWirelessTest'
    Y = parseWirelessData([baseDir 'uw-floor.txt']);
    Y = Y(216:end, :);

   case 'robotTwoLoops'
    Y = csvread([baseDir 'TwoLoops.slam'], 1, 0);
    Y = Y(1:floor(end/2), 4:end);
    Y(find(Y==-100))=-NaN;
    Y = (Y + 85)/15;
    
   case 'robotTraces'
    Y = csvread([baseDir 'Trace-3rdFloor-01.uwar.slam'], 1, 0); 
    Y = Y(1:floor(end/2), 4:end);
    Y(:, [3 4 38]) = []; % Remove columns of missing data.
    Y(find(Y==-100))=NaN;
    Y = (Y + 85)/15;

   case 'robotTracesTest'
    Y = csvread([baseDir 'Trace-3rdFloor-01.uwar.slam'], 1, 0); 
    Y = Y(ceil(end/2):end, 4:end);
    Y(:, [3 4 38]) = []; % Remove columns of missing data.
    Y(find(Y==-100))=NaN;
    Y = (Y + 85)/15;

   case 'osr'
    t = linspace(-pi, pi, 256);
    window = (cos(t) + 1)/2;
    [x, fs] = wavread([baseDir 'osr' dirSep 'OSR_uk_000_0020_8k.wav']);
    [r, theta] = stft(x, fs, 256, window);
    Y = [r(:, 1:32) theta(:, 1:32)];

   case 'cmu49BalanceArm'
    [Y, lbls, Ytest, lblstest] = lvmLoadData('cmu49Balance');
    % Extract left arm only 
    ind = [41:47 49:50];
    Y = Y(:, ind);  
    Ytest = Ytest(:, ind);
    
   case 'cmu49Balance'
    
    try 
      load([baseDir 'cmu49Balance.mat']);
    catch
      [void, errid] = lasterr;
      if strcmp(errid, 'MATLAB:load:couldNotReadFile');
        sampleEvery = 32;
        skel = acclaimReadSkel([baseDir 'mocap' dirSep 'cmu' dirSep '49' dirSep '49.asf']);
        examples = {'18', '19'};
        testExamples = {'20'};
        % Label differently for each sequence
        exlbls = eye(length(examples));
        testexlbls = eye(length(testExamples));
        totLength = 0;
        totTestLength = 0;
        for i = 1:length(examples)
          [tmpchan, skel] = acclaimLoadChannels([baseDir 'mocap' dirSep 'cmu' dirSep '49' dirSep '49_' ...
                              examples{i} '.amc'], skel);
          tY{i} = tmpchan(1:sampleEvery:end, :);
          tlbls{i} = repmat(exlbls(i, :), size(tY{i}, 1), 1);
          totLength = totLength + size(tY{i}, 1);
        end
        Y = zeros(totLength, size(tY{1}, 2));
        lbls = zeros(totLength, size(tlbls{1}, 2));
        endInd = 0;
        for i = 1:length(tY)
          startInd = endInd + 1;
          endInd = endInd + size(tY{i}, 1);
          Y(startInd:endInd, :) = tY{i};
          lbls(startInd:endInd, :) = tlbls{i};
        end
        for i = 1:length(testExamples)
          [tmpchan, skel] = acclaimLoadChannels([baseDir 'mocap' dirSep 'cmu' dirSep '49' dirSep '49_' ...
                              testExamples{i} '.amc'], skel);
          tYtest{i} = tmpchan(1:sampleEvery:end, :);
          tlblstest{i} = repmat(testexlbls(i, :), size(tYtest{i}, 1), 1);
          totTestLength = totTestLength + size(tYtest{i}, 1);
        end
        Ytest = zeros(totTestLength, size(tYtest{1}, 2));
        lblstest = zeros(totTestLength, size(tlblstest{1}, 2));
        endInd = 0;
        for i = 1:length(tYtest)
          startInd = endInd + 1;
          endInd = endInd + size(tYtest{i}, 1);
          Ytest(startInd:endInd, :) = tYtest{i};
          lblstest(startInd:endInd, :) = tlblstest{i};
        end
        save([baseDir 'cmu49Balance.mat'], 'Y', 'lbls', 'Ytest', 'lblstest');
      else
        error(lasterr);
      end
    end

    
   case 'cmu35gplvm'
    [Y, lbls, Ytest, lblstest] = lvmLoadData('cmu35WalkJog');
    skel = acclaimReadSkel([baseDir 'mocap' dirSep 'cmu' dirSep '35' dirSep '35.asf']);
    [tmpchan, skel] = acclaimLoadChannels([baseDir 'mocap' dirSep 'cmu' dirSep '35' dirSep '35_01.amc'], skel);

    Ytest = Ytest(find(lblstest(:, 2)), :);
    lblstest = lblstest(find(lblstest(:, 2)), 2);

    %left indices
    xyzInd = [2];
    xyzDiffInd = [1 3];
    rotInd = [4 6];
    rotDiffInd = [5];
    generalInd = [7:38 41:47 49:50 53:59 61:62];

    jointAngles  = asin(sin(pi*Y(:, generalInd)/180));
    jointAnglesTest  = asin(sin(pi*Ytest(:, generalInd)/180));
    
    endInd = [];
    for i = 1:size(lbls, 2)
      endInd = [endInd max(find(lbls(:, i)))];
    end
    catJointAngles = [];
    xyzDiff = [];
    catSinCos = [];
    startInd = 1;
    for i = 1:length(endInd)
      ind1 = startInd:endInd(i)-1;
      ind2 = startInd+1:endInd(i);
      catJointAngles = [catJointAngles; ...
                        jointAngles(ind2, :)];
      xyzDiff = [xyzDiff;
                 Y(ind1, xyzDiffInd) - Y(ind2, xyzDiffInd) ...
                 Y(ind2, xyzInd)];
      catSinCos = [catSinCos; ...
                   sin(pi*Y(ind2, rotInd)/180) ...
                   sin(pi*Y(ind1, rotDiffInd)/180)-sin(pi*Y(ind2, rotDiffInd)/180) ...
                   cos(pi*Y(ind2, rotInd)/180) ...
                   cos(pi*Y(ind1, rotDiffInd)/180)-cos(pi*Y(ind2, rotDiffInd)/180)];
      startInd = endInd(i)+1;
    end
    Y = [catJointAngles xyzDiff catSinCos];
    lbls = [];
    
    endInd = [];
    for i = 1:size(lblstest, 2)
      endInd = [endInd max(find(lblstest(:, i)))];
    end
    catJointAnglesTest = [];
    xyzDiffTest = [];
    catSinCosTest = [];
    startInd = 1;
    for i = 1:length(endInd)
      ind1 = startInd:endInd(i)-1;
      ind2 = startInd+1:endInd(i);
      catJointAnglesTest = [catJointAnglesTest; ...
                          jointAnglesTest(ind2, :)];
      xyzDiffTest = [xyzDiffTest;
                     Ytest(ind1, xyzDiffInd) - Ytest(ind2, xyzDiffInd) ...
                     Ytest(ind2, xyzInd)];
      catSinCosTest = [catSinCosTest; ...
                       sin(pi*Ytest(ind2, rotInd)/180) ...
                       sin(pi*Ytest(ind1, rotDiffInd)/180)-sin(pi*Ytest(ind2, rotDiffInd)/180) ...
                       cos(pi*Ytest(ind2, rotInd)/180) ...
                       cos(pi*Ytest(ind1, rotDiffInd)/180)-cos(pi*Ytest(ind2, rotDiffInd)/180)];
      startInd = endInd(i)+1;
    end                                                
    Ytest = [catJointAnglesTest xyzDiffTest catSinCosTest];
    lblstest = [];

   case 'cmu35Taylor'
    % The CMU 35 data set as Graham Taylor et al. have it in their
    % NIPS 2006 paper.
    [rawY, lbls, rawYtest, lblstest] = lvmLoadData('cmu35WalkJog');
    rawYtest = rawYtest(45:end, :);
    lblstest = lblstest(45:end, 2);
    skel = acclaimReadSkel([baseDir 'mocap' dirSep 'cmu' dirSep '35' dirSep '35.asf']);
    [tmpchan, skel] = acclaimLoadChannels([baseDir 'mocap' dirSep 'cmu' dirSep '35' dirSep '35_01.amc'], skel);
    posInd = [1 2 3];
    rotInd = [4 5 6];
    generalInd = [7:38 41:47 49:50 53:59 61:62];
    
    rawY = [rawY(:, posInd) sind(rawY(:, rotInd)) cosd(rawY(:, rotInd)) asind(sind(rawY(:, generalInd)))];
    rawYtest = [rawYtest(:, posInd) sind(rawYtest(:, rotInd)) cosd(rawYtest(:, rotInd)) asind(sind(rawYtest(:, generalInd)))];
    
    endInd = [];
    for i = 1:size(lbls, 2)
      endInd = [endInd max(find(lbls(:, i)))];
    end
    Y = [];
    startInd = 1;
    for i = 1:length(endInd)
      ind1 = startInd:endInd(i)-1;
      ind2 = startInd+1:endInd(i);
      Y = [Y; rawY(ind1, :) rawY(ind2, :)];
      startInd = endInd(i)+1;
    end  
    lbls = [];
    
    endInd = [];
    for i = 1:size(lblstest, 2)
      endInd = [endInd max(find(lblstest(:, i)))];
    end
    Ytest = [];
    startInd = 1;
    for i = 1:length(endInd)
      ind1 = startInd:endInd(i)-1;
      ind2 = startInd+1:endInd(i);
      Ytest = [Ytest; rawYtest(ind1, :) rawYtest(ind2, :)];
      startInd = endInd(i)+1;
    end                                                
    lblstest = [];

    
   case 'cmu35WalkJog'
    try 
      load([baseDir 'cmu35WalkJog.mat']);
    catch
      [void, errid] = lasterr;
      if strcmp(errid, 'MATLAB:load:couldNotReadFile');
        skel = acclaimReadSkel([baseDir 'mocap' dirSep 'cmu' dirSep '35' dirSep '35.asf']);
        examples = ...
            {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10', ...
             '11', '12', '13', '14', '15', '16', '17', '19', '20', ...
             '21', '22', '23', '24', '25', '26', '28', '30', '31', '32', '33', '34'};
        testExamples = {'18', '29'};
        % Label differently for each sequence
        exlbls = eye(31);
        testexlbls = eye(2);
        totLength = 0;
        totTestLength = 0;
        for i = 1:length(examples)
          [tmpchan, skel] = acclaimLoadChannels([baseDir 'mocap' dirSep 'cmu' dirSep '35' dirSep '35_' ...
                              examples{i} '.amc'], skel);
          tY{i} = tmpchan(1:4:end, :);
          tlbls{i} = repmat(exlbls(i, :), size(tY{i}, 1), 1);
          totLength = totLength + size(tY{i}, 1);
        end
        Y = zeros(totLength, size(tY{1}, 2));
        lbls = zeros(totLength, size(tlbls{1}, 2));
        endInd = 0;
        for i = 1:length(tY)
          startInd = endInd + 1;
          endInd = endInd + size(tY{i}, 1);
          Y(startInd:endInd, :) = tY{i};
          lbls(startInd:endInd, :) = tlbls{i};
        end
        for i = 1:length(testExamples)
          [tmpchan, skel] = acclaimLoadChannels([baseDir 'mocap' dirSep 'cmu' dirSep '35' dirSep '35_' ...
                              testExamples{i} '.amc'], skel);
          tYtest{i} = tmpchan(1:4:end, :);
          tlblstest{i} = repmat(testexlbls(i, :), size(tYtest{i}, 1), 1);
          totTestLength = totTestLength + size(tYtest{i}, 1);
        end
        Ytest = zeros(totTestLength, size(tYtest{1}, 2));
        lblstest = zeros(totTestLength, size(tlblstest{1}, 2));
        endInd = 0;
        for i = 1:length(tYtest)
          startInd = endInd + 1;
          endInd = endInd + size(tYtest{i}, 1);
          Ytest(startInd:endInd, :) = tYtest{i};
          lblstest(startInd:endInd, :) = tlblstest{i};
        end
        save([baseDir 'cmu35WalkJog.mat'], 'Y', 'lbls', 'Ytest', 'lblstest');
      else
        error(lasterr);
      end
    end

   case 'vowels'
    load([baseDir 'jon_vowel_data']);
    Y = [a_raw; ae_raw; ao_raw; ...
         e_raw; i_raw; ibar_raw; ...
         o_raw; schwa_raw; u_raw];
    Y(:, [13 26]) = [];
    lbls = [];
    for i = 1:9
      lbl = zeros(1, 9);
      lbl(i) = 1;
      lbls = [lbls; repmat(lbl, size(a_raw, 1), 1)];
    end
    

   case 'stick'
    Y = mocapLoadTextData([baseDir 'run1']);
    Y = Y(1:4:end, :);
    lbls = 'connect';
    
   case 'brendan'
    load([baseDir 'frey_rawface.mat']);
    Y = double(ff)';
    
   case 'digits'
    
    % Fix seeds
    randn('seed', 1e5);
    rand('seed', 1e5);

    load([baseDir 'usps_train.mat']);
    % Extract 600 of digits 0 to 4
    [ALL_T, sortIndices] = sort(ALL_T);
    ALL_DATA = ALL_DATA(sortIndices(:), :);
    Y = [];
    lbls = [];
    numEachDigit = 600;
    for digit = 0:4;
      firstDigit = min(find(ALL_T==digit));
      Y = [Y; ALL_DATA(firstDigit:firstDigit+numEachDigit-1, :)];
      lbl = zeros(1, 5);
      lbl(digit+1) = 1;
      lbls = [lbls; repmat(lbl, numEachDigit, 1)];
    end

   case 'twos'  
    % load data
    load([baseDir 'twos']);
    Y = 2*a-1;

   case 'oil'
    load([baseDir '3Class.mat']);
    Y = DataTrn;
    lbls = DataTrnLbls;

   case 'oilTest'
    load([baseDir '3Class.mat']);
    Y = DataTst;
    lbls = DataTstLbls;

   case 'oilValid'
    load([baseDir '3Class.mat']);
    Y = DataVdn;
    lbls = DataVdnLbls;

   case 'oil100'
    randn('seed', 1e5);
    rand('seed', 1e5);
    load([baseDir '3Class.mat']);
    Y = DataTrn;
    lbls = DataTrnLbls;
    indices = randperm(size(Y, 1));
    indices = indices(1:100);
    Y = Y(indices, :);
    lbls = lbls(indices, :);

   case 'swissRoll'
    load([baseDir 'swiss_roll_data']);
    Y = X_data(:, 1:1000)';

   case 'swissRollFull'
    load([baseDir 'swiss_roll_data']);
    Y = X_data(:, 1:3000)';

    
    
   otherwise
    error('Unknown data set requested.')
    
  end
end