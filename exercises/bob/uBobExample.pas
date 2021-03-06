unit uBob;

interface

type
  TBob = Class
  private
    class function IsSilence(aStatement: string): Boolean; static;
    class function IsYelling(aStatement: string): Boolean; static;
    class function IsQuestion(aStatement: string): Boolean; static;
  public
    class function Hey(aStatement: string): string; static;
  End;

implementation
uses RegularExpressions, System.SysUtils;

class function TBob.IsSilence(aStatement: string): Boolean;
begin
  result := aStatement.Trim = '';
end;

class function TBob.IsYelling(aStatement: string): Boolean;
begin
  result := (aStatement.ToUpper = aStatement) and TRegEx.IsMatch(aStatement, '[a-zA-Z]+');
end;

class function TBob.IsQuestion(aStatement: string): Boolean;
begin
  result := aStatement.Trim.EndsWith('?');
end;

class function TBob.Hey(aStatement: string): string;
begin
  if IsSilence(aStatement) then
    result := 'Fine.  Be that way!'
  else
    if IsYelling(aStatement) then
      result := 'Whoa, chill out!'
    else
      if IsQuestion(aStatement) then
        result := 'Sure.'
      else
        result := 'Whatever.';
end;

end.
