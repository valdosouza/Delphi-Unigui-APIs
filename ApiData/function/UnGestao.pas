unit UnGestao;

interface



  procedure setCasasDecimais(Sentido:String);
implementation

uses uSM;


procedure setCasasDecimais(Sentido:String);
Begin
  if Sentido = 'V' then
  Begin
    GbCasaDecimal := 2;
  End
  else
  Begin
    GbCasaDecimal := 4;
  End;
End;
end.
