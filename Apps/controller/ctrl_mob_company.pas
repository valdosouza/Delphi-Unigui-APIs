unit ctrl_mob_company;

interface

uses System.Classes,ctrl_mob_base, tblCompany,
    FireDAC.Comp.Client, FireDAC.Stan.Param;

Type
  TCtrlMobCompany = class(TCtrlMobBase)
    private

    public
      Registro : TCompany;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function getByKey:Boolean;
      Function getIDbyCNPJ(cnpj:String):Integer;
      Function getCnpjById:String;
      function insert:boolean;
      function save:Boolean;
      function delete:Boolean;
      procedure Clear;
  end;

implementation


uses MainModule;


procedure TCtrlMobCompany.Clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobCompany.Create(AOwner: TComponent);
begin
  Registro := TCompany.create;
  createTable;
end;

procedure TCtrlMobCompany.createTable;
begin
  execcmd(concat(
              'CREATE TABLE  if not exists  tb_company ( ',
              '  id int(11) , ',
              '  cnpj char(14) , ',
              '  ie varchar(45) , ',
              '  im varchar(45) , ',
              '  iest varchar(45) , ',
              '  dt_foundation date , ',
              '  crt char(1) , ',
              '  crt_modal char(1) , ',
              '  ind_ie_destinatario varchar(1) , ',
              '  created_at datetime , ',
              '  updated_at datetime , ',
              '  iss_ind_exig char(2) , ',
              '  iss_retencao char(1) , ',
              '  iss_inc_fiscal char(1) , ',
              '  iss_process_number varchar(50) , ',
              '  send_xml_nfe_only char(1) ) ;'
    ));
end;

function TCtrlMobCompany.delete: Boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

destructor TCtrlMobCompany.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobCompany.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobCompany.getCnpjById: String;
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

function TCtrlMobCompany.getIDbyCNPJ(cnpj: String): Integer;
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

function TCtrlMobCompany.insert: boolean;
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

function TCtrlMobCompany.save: Boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
