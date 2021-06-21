unit fm_package;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,FireDAC.Stan.Param,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmPackage = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmPackage: TFmPackage;

implementation

{$R *.dfm}

uses openForms, MainModule;

procedure TFmPackage.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct p.id, p.description, p.abbreviation ',
              ' from tb_package p ',
              ' inner join tb_institution_has_package i ',
              ' on (p.id = i.tb_package_id) ',
              ' where i.tb_institution_id =:tb_institution_id ',
              ' order by p.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmPackage.Sb_RegisterClick(Sender: TObject);
begin
  openCadPackage(0,DBLCB_Lista)
end;

procedure TFmPackage.Sb_SearchClick(Sender: TObject);
begin
  openSeaPackage(DBLCB_Lista);
end;

end.
