unit Controllerinvoice;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblinvoice, tblEntity, FireDAC.Comp.Client,Md5,
      FireDAC.Stan.Param, ControllerInstitution,ControllerEntityFiscal,
      ControllerCfop,ControllerOrder,controllerFinancialBills,
      pcnConversao, tblOrderItem, pcnNFe,System.Math, UnFunctions, objInvoice,
      ControllerInvoiceObs;

Type
  TControllerinvoice= Class(TBaseController)
  private
    procedure clear;
  public
    Registro        : Tinvoice;
    Pedido          : TControllerOrder;
    Observacao      : TControllerInvoiceObs;
    Financeiro      : TControllerFinancialBills;
    Estabelecimento : TControllerInstitution;
    Emitente        : TControllerEntityFiscal;
    Destinatario    : TControllerEntityFiscal;
    Cfop            : TControllerCfop;
    function existNumber:Boolean;
    function save:boolean;
    function update:boolean;
    function delete:boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function getByKey:boolean;
    function setStatus:Boolean;
    function setNfeNumber: Boolean;
    function getNextNfeNumber:String;
    function getNfeNumber:Boolean;
    function saveDataObjeto(DObj : TObjInvoice):Boolean;
  End;

implementation

{ Controllerinvoice }

procedure TControllerinvoice.clear;
begin
  clearObj(Registro);
end;

constructor TControllerinvoice.Create(AOwner: TComponent);
begin
  inherited;
  Registro        := Tinvoice.Create;
  Pedido          := TControllerOrder.Create(Self);
  Observacao      := TControllerInvoiceObs.Create(Self);
  Financeiro      := TControllerFinancialBills.Create(Self);
  Emitente        := TControllerEntityFiscal.Create(Self);
  Destinatario    := TControllerEntityFiscal.Create(Self);
  Estabelecimento := TControllerInstitution.Create(Self);
  Cfop            := TControllerCfop.Create(Self);
end;

function TControllerinvoice.delete: boolean;
begin
  deleteObj(registro)
end;

destructor TControllerinvoice.Destroy;
begin
  Registro.DisposeOf;
  Pedido.DisposeOf;
  Observacao.DisposeOf;
  Financeiro.DisposeOf;
  Emitente.DisposeOf;
  Destinatario.DisposeOf;
  Estabelecimento.DisposeOf;
  Cfop.DisposeOf;
  inherited;
end;

function TControllerinvoice.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerinvoice.saveDataObjeto(DObj: TObjInvoice): Boolean;
begin
  Try
    //SAlvar a Ordem que estará ligado a nota
    if DObj.Order.Usuario = 0 then
      DObj.Order.Usuario := DObj.NF.Estabelecimento;
    Self.ClonarObj( DObj.Order, Pedido.Registro );

    Pedido.save;

    Self.ClonarObj( DObj.NF, Registro );
    //Tratar o Emitente - Fisico
    if Length(DObj.EmitenteDoc) = 11 then
       Registro.Emitente := Emitente.Fisica.getIDbyCPF(DObj.EmitenteDoc)
    else
    //Tratar o Emitente - Juridico
    if Length(DObj.EmitenteDoc) >11  then
      Registro.Emitente := Emitente.Juridica.getIDbyCNPJ(DObj.EmitenteDoc);

    if Registro.Emitente = 0 then    
    Begin
      //Tratar o Emitente - Não informado CPF/CNPJ
      Emitente.NoDocNumber.Registro.Estabelecimento := DObj.NF.Estabelecimento;
      Emitente.NoDocNumber.Registro.Referencia := DObj.NF.Emitente;
      Emitente.NoDocNumber.getByReference;
      Registro.Emitente := Emitente.NoDocNumber.Registro.Codigo;
    End;

    //Tratar o DEstinatario - Fisico
    if Length(DObj.DestinatarioDoc) = 11 then
    Begin
       Registro.Destinatario := Destinatario.Fisica.getIDbyCPF(DObj.DestinatarioDoc);
    End
    else
    //Tratar o DEstinatario - Juridico
    if Length(DObj.DestinatarioDoc) >11  then
      Registro.Destinatario := Destinatario.Juridica.getIDbyCNPJ(DObj.DestinatarioDoc);

    if (Registro.Destinatario = 0) then
    Begin
      //Tratar o Destinatario - Não informado CPF/CNPJ
      Destinatario.NoDocNumber.Registro.Estabelecimento := DObj.NF.Estabelecimento;
      Destinatario.NoDocNumber.Registro.Referencia := DObj.NF.Destinatario;
      Destinatario.NoDocNumber.getByReference;
      Registro.Destinatario := Destinatario.NoDocNumber.Registro.Codigo;
      if (Registro.Destinatario = 0) then
        Registro.Destinatario := 2582;
    End;
    Self.save;
    Result := true;
  Except
    on E: Exception do
    Begin
      geralog('TControllerinvoice.saveDataObjeto - ',E.Message);
      Result := False;
    end;
  end;
end;

function TControllerinvoice.setNfeNumber: Boolean;
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
              'update tb_invoice inv set ',
              'inv.number =:number ',
              'where inv.tb_institution_id =:institution_id ',
              ' and (inv.id =:id) '
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      ParamByName('number').AsString := Registro.Numero;
      ExecSQL;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;

end;

function TControllerinvoice.setStatus: Boolean;
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
              'update tb_invoice inv set ',
              'inv.status =:status ',
              'where inv.tb_institution_id =:institution_id ',
              ' and (inv.id =:id) '
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      ParamByName('status').AsString := Registro.Status;
      ExecSQL;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

function TControllerinvoice.update: boolean;
begin
  try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;



function TControllerinvoice.getByKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerinvoice.getNextNfeNumber: String;
Var
  Lc_Qry : TFDQuery;
  Valor : Integer;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'select max(number) number ',
              'from tb_invoice inv ',
              'where inv.tb_institution_id =:institution_id ',
              ' and (inv.issuer =:issuer) '
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('issuer').AsInteger := Registro.Emitente;
      Active := True;
      FetchAll;
      Valor := StrToIntDef(FieldByName('number').AsString,0) + 1;
      Result := StrZero(Valor,6,0);
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

function TControllerinvoice.getNfeNumber: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    //Busca o registro pelo numero da nota é já posiciona o codigo da ordem
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'Select id, number ',
              'from tb_invoice ',
              'where ( tb_institution_id =:tb_institution_id ) ',
              ' and (number =:number) '
              ));
      if Registro.Emitente > 0 then
        sql.Add(' and (issuer =:issuer) ')
      else
        sql.Add(' and (issuer <>tb_institution_id) ');

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('number').AsString := Registro.Numero;
      if Registro.Emitente > 0 then
        ParamByName('issuer').AsInteger := Registro.Emitente;
      Prepare;
      Active := True;
      FetchAll;
      if (RecordCount > 0 ) then
      Begin
        registro.Codigo := FieldByName('id').AsInteger;
        Result := True;
      End
      else
      Begin
        Result := False;
      End;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

function TControllerinvoice.existNumber:Boolean;
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
              'Select number ',
              'from tb_invoice ',
              'where ( tb_institution_id =:tb_institution_id ) ',
              ' and (number =:number) ',
              ' and (issuer =:issuer) '
              ));

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('number').AsString := Registro.Numero;
      ParamByName('issuer').AsInteger := Registro.Emitente;
      Prepare;
      Active := True;
      FetchAll;
      Result := (RecordCount > 0 );
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

end.
