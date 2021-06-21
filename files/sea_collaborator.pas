
unit sea_collaborator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity_fiscal, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, FireDAC.Stan.Param,
  uniRadioGroup, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, MainModule,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaCollaborator = class(TSeaEntityFiscal)
  procedure InnerJoinSql;Override;
  procedure WhereSql;Override;
  procedure SetParameters;Override;
  procedure GetView;Override;
  procedure SetRegister;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaCollaborator: TSeaCollaborator;

implementation

{$R *.dfm}

uses openForms;

{ TSeaCollaborator }

procedure TSeaCollaborator.GetView;
begin
  openCadCollaborator(cds_searchid.AsInteger,nil);
end;

procedure TSeaCollaborator.InnerJoinSql;
begin
   inherited;
  InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_collaborator c '+
                  ' on (c.id = en.id) ';
  InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_collaborator c '+
                  ' on (c.id = en.id) ';
end;

procedure TSeaCollaborator.SetParameters;
begin
  inherited;
   with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    if chbx_Active.checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N'
  end;
end;

procedure TSeaCollaborator.SetRegister;
begin
  openCadCollaborator(0,nil);
end;

procedure TSeaCollaborator.WhereSql;
begin
  inherited;
  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( c.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( c.created_at between :dataini and :datafim ) ';
  end;

  WhereTxt := WhereTxt + ' and (c.tb_institution_id =:tb_institution_id)'+
                         ' and (c.active =:active) ';
  WhereTxt_1 := WhereTxt_1 + ' and (c.tb_institution_id =:tb_institution_id)'+
                                   ' and (c.active =:active) ';
end;

end.
