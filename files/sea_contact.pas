unit sea_contact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniDateTimePicker,
  uniCheckBox, uniEdit, uniLabel, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniPanel, cad_contact, MainModule, uniPageControl,
  Vcl.Menus, uniMainMenu;

type
  TSeaContact = class(TSeaEntity)
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;

  private

  protected
    procedure InitVariable;Override;
    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  public
    EntityOwnerID : Integer;
  end;

var
  SeaContact: TSeaContact;

implementation

{$R *.dfm}

uses
  openForms;

{ TSeaContact }

procedure TSeaContact.GetView;
begin
  openCadContact(cds_searchid.AsInteger,nil);
end;

procedure TSeaContact.InitVariable;
begin
  inherited;
  //Define grupo de email sera lista na pesquisa
  groupmailingID := '4';//Contato
end;

procedure TSeaContact.InnerJoinSql;
begin
 inherited;
    InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_contact c '+
                  ' on (c.id = en.id) ';
    InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_contact c '+
                  ' on (c.id = en.id) ';

end;

procedure TSeaContact.SetParameters;
begin
   inherited;
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    if EntityOwnerID > 0 then
          ParamByName('entity_owner_id').AsInteger := EntityOwnerID;

    if chbx_Active.checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N'
  end;
end;

procedure TSeaContact.SetRegister;
Begin
  openCadContact(0,nil);
end;

procedure TSeaContact.WhereSql;
begin
  inherited;
  WhereTxt := concat(
                WhereTxt ,
                     ' and (c.tb_institution_id =:tb_institution_id)',
                     ' and (c.active=:active) '
              );

  WhereTxt_1 := concat(
                     WhereTxt_1 ,
                     ' and (c.tb_institution_id =:tb_institution_id)',
                     ' and (c.active=:active) '
                  );
  if EntityOwnerID > 0 then
  BEgin
    WhereTxt := concat(
                  WhereTxt ,
                       ' and (c.tb_entity_owner_id =:entity_owner_id)'
                );

    WhereTxt_1 := concat(
                       WhereTxt_1 ,
                       ' and (c.tb_institution_id =:entity_owner_id)'
                    );



  End;

end;

end.
