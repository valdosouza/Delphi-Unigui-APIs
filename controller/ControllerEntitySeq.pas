unit ControllerEntitySeq;

interface

uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  tblentitySeq,
  BaseController;

Type
  TControllerEntitySeq = Class(TBaseController)

  private

  public
    Registro : TEntitySeq;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function getFree:Boolean;
    function isnert:boolean;
    function update:boolean;
    function Save:boolean;
    procedure setSequencia;
  End;

implementation


{ TControllerEntitySeq }

uses ControllerEntity;


constructor TControllerEntitySeq.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TEntitySeq.Create;
end;

destructor TControllerEntitySeq.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerEntitySeq.getFree: Boolean;
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
                  'from tb_entity_seq ',
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

function TControllerEntitySeq.isnert: boolean;
begin
  try
    insertObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;
end;

function TControllerEntitySeq.Save: boolean;
begin
  try
    saveObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;

end;

procedure TControllerEntitySeq.setSequencia;
Var
  Entity : TControllerEntity;
  I,Contador :Integer;
begin
  Try
    Entity := TControllerEntity.Create(nil);
    Entity.getlist;
    Contador := 1;
    I := 0;
    repeat
      if not (Entity.Lista[I].Codigo = Contador )then
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
    until I = Entity.Lista.Count -1;

  Finally
    Entity.DisposeOf;
  End;
end;

function TControllerEntitySeq.update: boolean;
begin
  try
    updateObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;
end;

end.
