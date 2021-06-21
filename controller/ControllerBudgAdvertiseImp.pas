unit ControllerBudgAdvertiseImp;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBudgAdvertiseImp, Md5, FireDAC.Stan.Param,
      ControllerEntity, ControllerBank, System.Generics.Collections,
      Datasnap.DBClient, Data.DB, FireDAC.Comp.Client,  IntMedFormats,
  Datasnap.Provider;

Type

  TControllerBudgAdvertiseImp = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TBudgAdvertiseImp;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;

    function getByKey:Boolean;
    procedure getIFList(res : TClientDataSet; Dsp:TDataSetProvider);
  End;

implementation

{ ControllerMedPriceListJR }

procedure TControllerBudgAdvertiseImp.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerBudgAdvertiseImp.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBudgAdvertiseImp.Create;
end;

function TControllerBudgAdvertiseImp.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerBudgAdvertiseImp.Destroy;
begin
  Registro.disposeOf;
  inherited;
end;


function TControllerBudgAdvertiseImp.insert: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBudgAdvertiseImp.save: boolean;
begin

  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerBudgAdvertiseImp.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerBudgAdvertiseImp.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerBudgAdvertiseImp.getIFList(res: TClientDataSet; Dsp:TDataSetProvider);
Var
  Lc_Qry : TfdQuery;
begin
  TRy
    Lc_Qry := createQuery;
    Dsp.DataSet := Lc_Qry;
    res.Active := False;

    with Lc_Qry do
    Begin
      Active := false;
      SQL.Clear;
      SQL.Add(concat(
          'select bo.id, bai.id id_item, bo.number, c.id CityID, c.name, e.id broadcasterID, e.nick_trade ,bai.unit_value, ',
          'bai.formats, pjr.measure, pjr.nr_columns, pjr.size_columns, ',
          'pjr.online_price, bai.insertion ',
          'from tb_budg_advertise bo ',
          '  inner join tb_budg_advertise_imp bai ',
          '  on (bai.tb_budg_advertise_id = bo.id) ',
          '     and (bai.tb_institution_id = bo.tb_institution_id) ',
          '  inner join tb_med_price_list_jr pjr ',
          '  on (bai.tb_med_price_list_jr_id = pjr.id) ',
          '     and (bai.tb_institution_id = pjr.tb_institution_id) ',
          '     and (bai.tb_broadcaster_id = pjr.tb_broadcaster_id) ',
          '  inner join tb_broadcaster b ',
          '  on (bai.tb_broadcaster_id = b.id) ',
          '     and (bai.tb_institution_id = b.tb_institution_id) ',
          '  inner join tb_entity e ',
          '  on (e.id = b.id) ',
          '  inner join tb_address adr ',
          '  on (adr.id = b.id) ',
          '  inner join tb_city c ',
          '  on (c.id =adr.tb_city_id) ',
          'where bo.tb_institution_id =:tb_institution_id ',
          ' and  bo.id =:id '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := True;
      FetchAll;
    End;
  Finally
    res.Active := True;
    FinalizaQuery(Lc_Qry);
  End;
end;

end.
