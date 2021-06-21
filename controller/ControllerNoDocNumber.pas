unit ControllerNoDocNumber;

interface

uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  tblNoDocNumber,
  BaseController;

Type
  TControllerNoDocNumber = Class(TBaseController)

  private

  public
    Registro : TNoDocNumber;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function insert:boolean;
    function update:boolean;
    function Save:boolean;
    function getByReference:Boolean;

  End;

implementation


{ TControllerNoDocNumber }

uses ControllerEntity;


constructor TControllerNoDocNumber.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TNoDocNumber.Create;
end;

destructor TControllerNoDocNumber.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerNoDocNumber.getByReference: Boolean;
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
                  'from tb_no_doc_number ',
                  'where ( tb_institution_id =:tb_institution_id ) ',
                  ' and ( reference =:reference) '
              ));

      paramByName('tb_institution_id').asinteger := Registro.Estabelecimento;
      paramByName('reference').asinteger := Registro.Referencia;
      Active := True;
      FetchAll;
      exist := (recordCount > 0);
      if exist then
        get(Lc_Qry,Registro);
      Result := exist;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;

end;

function TControllerNoDocNumber.insert: boolean;
begin
  try
    insertObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;
end;

function TControllerNoDocNumber.Save: boolean;
begin
  try
    saveObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;

end;

function TControllerNoDocNumber.update: boolean;
begin
  try
    updateObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;
end;

end.
