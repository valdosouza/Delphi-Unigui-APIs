unit ControllerMailingSeq;

interface

uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  tblmailingSeq,
  BaseController;

Type
  TControllerMailingSeq = Class(TBaseController)

  private

  public
    Registro : TMailingSeq;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function getFree:Boolean;
    function insert:boolean;
    function update:boolean;
    function Save:boolean;
    procedure setSequencia;
  End;

implementation


{ TControllerMailingSeq }

uses ControllerMailing;


constructor TControllerMailingSeq.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMailingSeq.Create;
end;

destructor TControllerMailingSeq.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerMailingSeq.getFree: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                  'select * ',
                  'from tb_mailing_seq ',
                  'where used = ''N'' ',
                  'limit 1 '
              ));
      Active := True;
      FetchAll;
      exist := (recordCount > 0);
      if exist then
      Begin
        get(Lc_Qry,Registro);
        Registro.Usado := 'S';
        update;
      End;
      Result := exist;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

function TControllerMailingSeq.insert: boolean;
begin
  try
    insertObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;
end;

function TControllerMailingSeq.Save: boolean;
begin
  try
    saveObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;

end;

procedure TControllerMailingSeq.setSequencia;
Var
  Mailing : TControllerMailing;
  I,Contador :Integer;
begin
  Try
    Mailing := TControllerMailing.Create(nil);
    Mailing.getlist;
    Contador := 1;
    I := 0;
    repeat
      if not (Mailing.Lista[I].Codigo = Contador )then
      Begin
        Registro.Codigo := Contador;
        Registro.Usado  := 'N';
        Save;
        inc(contador);
      End
      else
      Begin
        inc(contador);
        inc(I);
      End;
    until I = Mailing.Lista.Count -1;

  Finally
    Mailing.DisposeOf;
  End;
end;

function TControllerMailingSeq.update: boolean;
begin
  try
    updateObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;
end;

end.

