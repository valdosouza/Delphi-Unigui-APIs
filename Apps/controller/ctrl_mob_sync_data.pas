unit ctrl_mob_sync_data;

interface

uses System.Classes, System.SysUtils,ctrl_mob_base, tblSyncTable, GenericDao,
      FireDAC.Comp.Client,FireDAC.Stan.Param,FireDAC.Comp.Script;

Type
  TCtrlMobSyncData =  class(TCtrlMobBase)
    private
     procedure get(Qry:TFDQuery;Obj:TSyncTable);

    protected
      procedure setStrutureUpdate;Override;

    public
      Registro : TSyncTable;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      procedure dropTable;
      procedure updateTbInstituition;
      procedure getLastUpdate;
      function save:boolean;
      function deleteAll:Boolean;
      function deleteRecebimentos:Boolean;
      function deleteEnvios:Boolean;
      function deleteTbEstoque:Boolean;
      function setTimeTo:Boolean;
      function resetAllData(InstitutionID:Integer):Boolean;
      function resetCustomerData(InstitutionID:Integer):Boolean;
      function resetProductData(InstitutionID:Integer):Boolean;
  end;

implementation


uses MainModule, UnFunctions;


constructor TCtrlMobSyncData.Create(AOwner: TComponent);
begin
  createTable;
  setStrutureUpdate;
  Registro := TSyncTable.Create;
end;

procedure TCtrlMobSyncData.createTable;
Begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_sync_table ( ',
                ' tb_institution_id int(11), ',
                ' id varchar(100) , ',
                ' direction char(1), ',
                ' last_updated timestamp  );'
      ));
end;

function TCtrlMobSyncData.deleteAll: Boolean;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'delete ',
                'from tb_sync_table  ',
                'where ( tb_institution_id=:tb_institution_id) )'
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TCtrlMobSyncData.deleteEnvios: Boolean;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'delete ',
                'from tb_sync_table ',
                ' where direction = ''S'' ',
                ' and (tb_institution_id =:tb_institution_id )'
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobSyncData.deleteRecebimentos: Boolean;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'delete ',
                'from tb_sync_table ',
                'where ( direction = ''E'' ) ',
                ' and ( tb_institution_id=:tb_institution_id) '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TCtrlMobSyncData.deleteTbEstoque: Boolean;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'delete from tb_sync_table  ',
                'where direction = ''S''    ',
                ' and id = ''tb_stock_list'' ',
                ' and (tb_institution_id =:tb_institution_id )'
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

destructor TCtrlMobSyncData.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  {$ENDIF }

end;

procedure TCtrlMobSyncData.dropTable;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'DROP TABLE if exists tb_sync_table; '
      ));
      ExecSQL;

    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

procedure TCtrlMobSyncData.get(Qry: TFDQuery; Obj: TSyncTable);
begin
  with Qry,Obj do
  Begin
    Codigo:= FieldByName('id').asString;
    Direcao:= FieldByName('direction').asString;
    Atualizacao:= FieldByName('last_updated').AsDateTime;
  End;
end;

procedure TCtrlMobSyncData.getLastUpdate;
begin
  //Como são compatilhados não precisa baixar duas vezes
  if  (Registro.Codigo = 'tb_country')  or
      (Registro.Codigo = 'tb_state')    or
      (Registro.Codigo = 'tb_city')     then
  Registro.Estabelecimento := 0;
  _getByKey(Registro);
end;

function TCtrlMobSyncData.resetCustomerData(InstitutionID:Integer): Boolean;
Var
  FDScript : TFDScript;
Begin
  Try
    FDScript := TFDScript.Create(self);
    FDScript.Connection := getConnection;
    with FDScript do
    begin
      SQLScripts.Clear;
      SQLScripts.Add;
      with SQLScripts[0].SQL do
      begin
        Add(concat(
              'delete from tb_sync_table                ',
              'where id in ( ''tb_company'',            ',
              '              ''tb_person'',             ',
              '              ''tb_address'',            ',
              '              ''tb_phone'',              ',
              '              ''tb_social_media'',       ',
              '              ''tb_customer'',           ',
              '              ''tb_entity_has_mailing'', ',
              '              ''tb_mailing'',            ',
              '              ''tb_entity'',             ',
              '              ''tb_mailing_group'')      ',
              ' and ( tb_institution_id =',InstitutionID.ToString , ') '
        ));
      end;
      ValidateAll;
      ExecuteAll;
    end;
  Finally
    FDScript.DisposeOf;
  End;


end;

function TCtrlMobSyncData.resetProductData(InstitutionID:Integer): Boolean;
Var
  FDScript : TFDScript;
Begin
  Try
    FDScript := TFDScript.Create(self);
    FDScript.Connection := getConnection;
    with FDScript do
    begin
      SQLScripts.Clear;
      SQLScripts.Add;
      with SQLScripts[0].SQL do
      begin
        Add( concat( 'delete from tb_price ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_price_list ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_stock_balance ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_stock_list ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_stock ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_merchandise ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_product ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_brand ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_category ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_measure ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_package ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add(concat(
              'delete from tb_sync_table            ',
              'where id in ( ''tb_price'',          ',
              '              ''tb_price_list'',     ',
              '              ''tb_stock_balance'',  ',
              '              ''tb_stock_list'',     ',
              '              ''tb_stock'',          ',
              '              ''tb_merchandise'',    ',
              '              ''tb_product'',        ',
              '              ''tb_brand'',          ',
              '              ''tb_category'',       ',
              '              ''tb_measure'',        ',
              '              ''tb_package'')         ',
              ' and ( tb_institution_id =',InstitutionID.ToString , ') '
        ));

      end;
      ValidateAll;
      ExecuteAll;
    end;
  Finally
    FDScript.DisposeOf;
  End;


end;

function TCtrlMobSyncData.resetAllData(InstitutionID:Integer): Boolean;
Var
  FDScript : TFDScript;
Begin
  Try
    FDScript := TFDScript.Create(self);
    FDScript.Connection := getConnection;
    with FDScript do
    begin
      SQLScripts.Clear;
      SQLScripts.Add;
      with SQLScripts[0].SQL do
      begin
        Add( concat( 'delete from tb_city; '));
        Add( concat( 'delete from tb_company; '));
        Add( concat( 'delete from tb_state; '));
        //Add( concat( 'delete from tb_config ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_country;'));
        Add( concat( 'delete from tb_customer ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_entity ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_entity_has_mailing ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_financial ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_institution_has_entity ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_institution_has_linebusiness ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_institution_has_payment_types ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_linebusiness ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_mailing ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_mailing_group ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_brand ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_category ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_measure ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_merchandise ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_package ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_payment_types ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_person ',' where ( tb_institution_id =',InstitutionID.ToString , ');'));
        //Add( concat( 'delete from tb_phone ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_price ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_price_list ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_product ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_salesman ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        //Add( concat( 'delete from tb_social_media ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));

        Add( concat( 'delete from tb_stock ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_stock_balance ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_stock_list ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
        Add( concat( 'delete from tb_sync_table ',' where ( tb_institution_id =',InstitutionID.ToString , '); '));
      end;
      ValidateAll;
      ExecuteAll;
    end;
  Finally
    FDScript.DisposeOf;
  End;
end;

function TCtrlMobSyncData.save: boolean;
begin
  try
    if  (Registro.Codigo = 'tb_country')  or
        (Registro.Codigo = 'tb_state')    or
        (Registro.Codigo = 'tb_city')     then
    Registro.Estabelecimento := 0;

    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

procedure TCtrlMobSyncData.setStrutureUpdate;
begin
  inherited;
  createColumnIfNotExists('tb_sync_table','tb_institution_id','int(11)');
end;

function TCtrlMobSyncData.setTimeTo: Boolean;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'update tb_sync_table set     ',
                'last_updated =:last_updated  ',
                'where ( tb_institution_id =:tb_institution_id ) '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('last_updated').AsDateTime := Registro.Atualizacao;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;



procedure TCtrlMobSyncData.updateTbInstituition;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'update tb_sync_table set     ',
                'tb_institution_id =:tb_institution_id  ',
                'where ( tb_institution_id is null ) or (tb_institution_id = '''' )  '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

end.

