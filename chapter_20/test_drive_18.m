clear classes; fclose all; close all force;
star = cStar;
star2 = cStar(star);
whos
disp(star.Size')
disp(star.ColorRgb')
disp(star.Points)
star.Size = [2;3];
disp(star.Size')
star
fieldnames(star)
fieldnames(star, '-full')
fieldnames(star, '-possible')
struct(star)
star = [cStar cStar; cStar cStar];
size(star)
[star.Size]
{star.Size}
disp(class(star))
disp(isa(star, 'cShape'))
disp(isa(star, 'cDiamond'))
disp(class(star))
disp(isa(star, 'cShape'))
disp(isa(star, 'cDiamond'))
whos
star = draw([cStar  1.5*cStar]);