HD = 1;
clear HDD
clear H
for i = 1:1:length(LongStory)
    CurrentStory =  LongStory{i};
    
    if (length(CurrentStory) < 99) & (length(CurrentStory) > 4) 
        if CurrentStory(length(CurrentStory)).Action ~= "Absorbtion"
        HDD(HD) = CurrentStory(length(CurrentStory)).Vector.WaveLength;
        HD = HD +1;
        end
    end

end

H = histogram(HDD,300)

hold on

for i = 1:1:length(LongStory)
    CurrentStory =  LongStory{i};
     
        HDD1(i) = CurrentStory(1).Vector.WaveLength;
        
end
 
H1 = histogram(HDD1,300)


