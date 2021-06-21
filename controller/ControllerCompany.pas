unit ControllerCompany;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblCompany, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerCompany = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TCompany;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    procedure verifyDuplicate;
    Function getIDbyCNPJ(cnpj:String):Integer;
    Function getCnpjById:String;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    procedure getByCNPJ;
  End;

implementation

{ ControllerCompany }

procedure TControllerCompany.clear;
begin
  inherited;
  clearObj(Registro);
end;

constructor TControllerCompany.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCompany.Create;
end;

function TControllerCompany.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerCompany.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;



function TControllerCompany.insert: boolean;
begin
  try
    if ( Registro.Codigo = 0 ) then
      Registro.Codigo := getNextByField(Registro,'id',0);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerCompany.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

procedure TControllerCompany.verifyDuplicate;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('Select c.* '+
              'from tb_entity e '+
              '  inner join tb_company c '+
              '  on (c.id = e.id) '+
              'where (c.cnpj =:cnpj) '+
              ' and (c.id <> :id)');
      ParamByName('cnpj').AsString := Registro.CNPJ;
      ParamByName('id').AsInteger := Registro.Codigo;
      active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;


procedure TControllerCompany.getByCNPJ;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := getByField('tb_company','cnpj',registro.CNPJ);
    if exist then get(Lc_Qry,Registro);
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerCompany.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerCompany.getCnpjById: String;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('Select c.cnpj '+
              'from tb_company c '+
              'where (c.id =:id) ');
      ParamByName('id').AsInteger := Registro.Codigo;;
      active := True;
      FetchAll;
      Result := FieldByName('cnpj').AsString;
    End;

  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerCompany.getIDbyCNPJ(cnpj: String): Integer;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('Select c.id '+
              'from tb_company c '+
              'where (c.cnpj =:cnpj) ');
      ParamByName('cnpj').AsString := cnpj;
      active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if exist then
        Result := FieldByName('id').AsInteger
      else
        Result := 0;
    End;

  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

end.

