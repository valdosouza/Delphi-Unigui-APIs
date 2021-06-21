unit ControllerTaxRuler;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblTaxRuler, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerCfop,  ControllerTaxIcmsNr, ControllerTaxIcmsSn, ControllerDeterBaseTaxIcms,
      ControllerDeterBaseTaxIcmsST, ControllerDischargeIcms, ControllerObservation,
       ControllerTaxPis, ControllerTaxIPI, ControllerTaxCofins, ControllerState;


Type
  TControllerTaxRuler = Class(TBaseController)
    procedure clear;
  private

  public
    Registro            : TTaxRuler;
    TaxIcmsNr           : TControllerTaxIcmsNr;
    TaxIcmsSn           : TControllerTaxIcmsSn ;
    DeterBaseTaxIcms    : TControllerDeterBaseTaxIcms;
    DeterBaseTaxIcmsST  : TControllerDeterBaseTaxIcmsST;
    DischargeIcms       : TControllerDischargeIcms;
    Observation         : TControllerObservation;
    CFOP                : TControllerCFOP;
    IPI                 : TControllerTaxIPI;
    PIS                 : TControllerTaxPIS;
    Cofins              : TControllerTaxCofins;
    State               : TControllerState;
    EstadoEmitente : Integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete: boolean;
    function getRuler:Boolean;
    function getByKey:Boolean;
  End;

implementation

{ ControllerTaxRuler}

procedure TControllerTaxRuler.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerTaxRuler.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TTaxRuler.Create;
  Cfop := TControllerCfop.Create(Self);
  TaxIcmsNr := TControllerTaxIcmsNr.Create(self);
  TaxIcmsSn := TControllerTaxIcmsSn.Create(self);
  DeterBaseTaxIcms := TControllerDeterBaseTaxIcms.Create(self);
  DeterBaseTaxIcmsST := TControllerDeterBaseTaxIcmsST.Create(self);
  DischargeIcms := TControllerDischargeIcms.Create(self);
  Observation := TControllerObservation.Create(self);
  IPI := TControllerTaxIPI.Create(self);
  PIS := TControllerTaxPIS.Create(self);
  Cofins := TControllerTaxCofins.Create(self);
  State := TControllerState.Create(self);
end;

function TControllerTaxRuler.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerTaxRuler.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Cfop);
  FreeAndNil(TaxIcmsNr);
  FreeAndNil(TaxIcmsSn);
  FreeAndNil(DeterBaseTaxIcms);
  FreeAndNil(DeterBaseTaxIcmsST);
  FreeAndNil(DischargeIcms);
  FreeAndNil(Observation);
  FreeAndNil(CFOP);
  FreeAndNil(IPI);
  FreeAndNil(PIS);
  FreeAndNil(Cofins);
  inherited;
end;

function TControllerTaxRuler.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerTaxRuler.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerTaxRuler.getRuler: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(Concat(
                'Select t.* ',
                'from tb_tax_ruler ',
                'where (tb_institution_id =:tb_institution_id) ',
                '   AND ( ( tb_product_id =:tb_product_id ) OR ( tb_product_id = 0 ) ) ',
                '   AND ( (ncm =:ncm) OR (ncm IS NULL) OR (ncm = '''') ) ',
                '   AND ( origem=:origem ) ',
                '   AND ( for_icms_st =:for_icms_st ) ',
                '   AND ( for_consumer =:for_consumer ) ',
                '   AND ( crt =:crt ) ',
                '   AND ( direction =:direction ) ',
                '   AND ( transaction_kind =:transaction_kind) '
              ));

      if Registro.Cfop <> '' then
        sql.Add(' and ( tb_cfop_id =:tb_cfop_id )');

      if ( Registro.Estado = EstadoEmitente) then
        sql.add('AND ( tb_state_id =:tb_state_id ) ')
      else
        sql.add('AND ( (tb_state_id =:tb_state_id) or (tb_state_id = 0) OR (tb_state_id IS NULL) )');

      Sql.add(' Order By ncm DESC ');

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_product_id').AsInteger := Registro.Produto;
      ParamByName('ncm').AsString :=  Registro.NCM;
      ParamByName('origem').AsString := Registro.Origem;
      ParamByName('for_icms_st').AsString := Registro.ParaIcmsSt;
      ParamByName('for_consumer').AsString := Registro.ParaConsumidor;
      ParamByName('crt').AsString := Registro.CRT;
      ParamByName('direction').AsString := Registro.Direcao;
      ParamByName('transaction_kind').AsString := Registro.TipoTransacao;

      if Registro.Cfop <> '' then
        ParamByName('tb_cfop_id').AsString :=  Registro.Cfop;

      ParamByName('tb_state_id').AsInteger := Registro.Estado;

      Active := True;
      FetchAll;
      exist := ( RecordCount > 0 );
      if Exists then get(Lc_Qry,Registro);
      Result := Exists;
    End;
  Finally
    Lc_Qry.close;
    FReeandNil(Lc_Qry)
  End;
end;

end.
