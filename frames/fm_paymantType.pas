unit fm_paymantType;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,FireDAC.Stan.Param,
  uniDBComboBox, uniDBLookupComboBox;

type
  TfmPaymentType = class(TBaseFrameList)
    procedure setImages;Override;
    procedure sb_searchClick(Sender: TObject);
    procedure sb_registerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  fmPaymentType: TfmPaymentType;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TfmPaymentType }

procedure TfmPaymentType.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct pt.id, pt.description ',
              ' from tb_payment_types pt ',
              ' inner join tb_institution_has_payment_types i ',
              ' on (pt.id = i.tb_payment_types_id) ',
              ' where i.tb_institution_id =:tb_institution_id ',
              ' order by pt.description '
            ));
    ParamByName('tb_institution_id').AsInteger := GbInstitution;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

procedure TfmPaymentType.sb_registerClick(Sender: TObject);
begin
  openCadPaymentTypes(0,DBLCB_Lista);
end;

procedure TfmPaymentType.sb_searchClick(Sender: TObject);
begin
  openSeaPaymentTypes(DBLCB_Lista);
end;

procedure TfmPaymentType.setImages;
begin
  buttonIcon(sb_search,'miniSearch.bmp');
end;

end.
