unit fm_address_delivery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmAdressDelivery = class(TBaseFrameList)
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmAdressDelivery: TFmAdressDelivery;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TFmAdressDelivery }

procedure TFmAdressDelivery.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' SELECT adr.id, adr.street, co.name, st.name, ci.name, ent.name_company,  adr.nmbr, adr.complement, adr.neighborhood, adr.region, adr.kind, adr.zip_code  ',
              ' FROM tb_address adr ',
              ' INNER JOIN tb_entity ent ',
              ' on (ent.id = adr.id) ',
              ' INNER join tb_country co ',
              ' on (co.id = adr.tb_country_id) ',
              ' inner join tb_state st ',
              ' on (st.id = adr.tb_state_id) ',
              ' inner join tb_city ci ',
              ' on (ci.id = adr.tb_city_id) ',
              ' where adr.id is not null ',
              ' order by ent.name_company '
            ));

    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmAdressDelivery.Sb_SearchClick(Sender: TObject);
begin
  inherited;
 openSeaAddressDelivery(DBLCB_Lista)
end;

end.
