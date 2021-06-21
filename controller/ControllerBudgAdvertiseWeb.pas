unit ControllerBudgAdvertiseWeb;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBudgAdvertiseWeb, Md5, FireDAC.Stan.Param,
      ControllerEntity, ControllerBank, System.Generics.Collections,
      Datasnap.DBClient, Data.DB, FireDAC.Comp.Client,  IntMedFormats,Datasnap.Provider;

Type

  TControllerBudgAdvertiseWeb = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TBudgAdvertiseWeb;
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

procedure TControllerBudgAdvertiseWeb.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerBudgAdvertiseWeb.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBudgAdvertiseWeb.Create;
end;

function TControllerBudgAdvertiseWeb.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerBudgAdvertiseWeb.Destroy;
begin
  Registro.disposeOf;
  inherited;
end;


function TControllerBudgAdvertiseWeb.insert: boolean;
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

function TControllerBudgAdvertiseWeb.save: boolean;
begin

  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerBudgAdvertiseWeb.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerBudgAdvertiseWeb.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerBudgAdvertiseWeb.getIFList(res: TClientDataSet;
  Dsp: TDataSetProvider);
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
                'select bo.id, baw.id id_item, bo.number, UPPER(c.name) name,  sm.link ,baw.formats, baw.days, baw.page_views, baw.unit_value ',
                'from tb_budg_advertise bo ',
                '  inner join tb_budg_advertise_web baw ',
                '  on (baw.tb_budg_advertise_id = bo.id) ',
                '   and (baw.tb_institution_id = bo.tb_institution_id) ',
                '    inner join tb_med_price_list_ol pol ',
                '    on (baw.tb_med_price_list_ol_id = pol.id) ',
                '      and (baw.tb_institution_id = pol.tb_institution_id) ',
                '      and (baw.tb_broadcaster_id = pol.tb_broadcaster_id) ',
                '    inner join tb_broadcaster b ',
                '    on (baw.tb_broadcaster_id = b.id) ',
                '       and (baw.tb_institution_id = b.tb_institution_id) ',
                '    inner join tb_entity e ',
                '    on (e.id = b.id) ',
                '    inner join tb_address adr ',
                '    on (adr.id = b.id) ',
                '    inner join tb_city c ',
                '    on (c.id =adr.tb_city_id) ',
                '    left outer join tb_social_media sm ',
                '    on (sm.id = e.id)  and (sm.kind = ''www'') ',
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
