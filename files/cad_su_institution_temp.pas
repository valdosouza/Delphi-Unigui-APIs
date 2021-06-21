unit cad_su_institution_temp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_institution, Vcl.Menus, uniMainMenu,
  uniMultiItem, uniComboBox, uniCheckBox, uniMemo, uniPageControl,
  uniRadioGroup, uniPanel, uniDateTimePicker, uniGUIClasses, uniEdit, uniLabel,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniBasicGrid,
  uniDBGrid, ControllerModule, Data.DB, Datasnap.DBClient, tblModule;

type
  TCadSuInstitutionTemp = class(TCadInstitution)
    Modulos: TUniTabSheet;
    dbg_AvalibleList: TUniDBGrid;
    sb_int_to_mod: TUniSpeedButton;
    sb_mod_to_int: TUniSpeedButton;
    UniDBGrid1: TUniDBGrid;
    MnuUsuarios: TUniMenuItem;
    cds_available: TClientDataSet;
    cds_availableid: TIntegerField;
    cds_availabledescription: TStringField;
    ds_search_available: TDataSource;
    cds_used: TClientDataSet;
    cds_usedid: TIntegerField;
    cds_useddescription: TStringField;
    ds_search_use: TDataSource;
    procedure MnuUsuariosClick(Sender: TObject);
    procedure sb_int_to_modClick(Sender: TObject);
    procedure sb_mod_to_intClick(Sender: TObject);
  private
    procedure InterfaceIn;
    procedure InterfaceOut;
    Procedure availableList;
    Procedure UsedList;
  protected
    procedure Save;Override;
    procedure SaveModule;
    procedure ShowData;Override;
  public
    { Public declarations }
  end;

var
  CadSuInstitutionTemp: TCadSuInstitutionTemp;

implementation

{$R *.dfm}

uses openForms;

{ TCadInstitution1 }

procedure TCadSuInstitutionTemp.availableList;
Var
  I : Integer;
  RegInterface : TModule;
begin
  Institution.Module.getAvailableList(Institution.Registro.Codigo);
  with self.cds_available, Institution  do
  Begin
    if not cds_available.Active then CreateDataSet;
    LogChanges := False;
    cds_available.EmptyDataSet;
    for I := 0 to Module.Lista.Count - 1 do
    Begin
      RegInterface := Module.Lista[I];
      Append;
      FieldByName('id').AsInteger           := RegInterface.Codigo;
      FieldByName('description').AsString  := RegInterface.Descricao;
      Post;
    End;
    LogChanges := True;
  End;


end;

procedure TCadSuInstitutionTemp.InterfaceIn;
begin
  //insere a interface no modulo
  if cds_available.RecordCount > 0 then
  begin
    cds_used.Append;
    cds_usedid.AsInteger := cds_availableid.AsInteger;
    cds_useddescription.AsString := cds_availabledescription.AsString;
    cds_used.Post;
    //retira da lista disponivel
    cds_available.Delete;
  end;

end;

procedure TCadSuInstitutionTemp.InterfaceOut;
begin
  if cds_used.RecordCount > 0 then
  begin
    //insere a interface no modulo
    cds_available.Append;
    cds_availableid.AsInteger := cds_usedid.AsInteger;
    cds_availabledescription.AsString := cds_useddescription.AsString;
    cds_available.Post;
    //retira da lista disponivel
    cds_used.Delete
  end;

end;

procedure TCadSuInstitutionTemp.MnuUsuariosClick(Sender: TObject);
begin
  openSeaUser(Institution.Registro.Codigo);
end;

procedure TCadSuInstitutionTemp.Save;
begin
  inherited;
  with Institution do
  Begin
    SaveModule;
    availableList;
    UsedList;
  End;

end;

procedure TCadSuInstitutionTemp.SaveModule;
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
    if cds_used.ChangeCount > 0 then
    Begin
      cds_temp := TClientDataSet.Create(Self);
      cds_temp.Data := cds_used.Delta;
      cds_temp.First;
      while not cds_temp.eof do
      Begin
        with Institution.InstitutionHasModule do
        Begin

          Registro.Estabelecimento      := Institution.Registro.Codigo;
          registro.CodigoModulo         := cds_temp.FieldByName('id').AsInteger;

           case cds_temp.UpdateStatus of
            usModified  : Institution.InstitutionHasModule.update;
            usInserted  : Institution.InstitutionHasModule.insert;
            usDeleted   : Institution.InstitutionHasModule.delete
           end;
        End;
        cds_temp.next;
      End;
      cds_temp.Close;
      FreeAndNil(cds_temp);
    End;
end;

procedure TCadSuInstitutionTemp.sb_int_to_modClick(Sender: TObject);
begin
  InterfaceIn;
end;

procedure TCadSuInstitutionTemp.sb_mod_to_intClick(Sender: TObject);
begin
  InterfaceOut;
end;

procedure TCadSuInstitutionTemp.ShowData;
begin
  inherited;
  with Institution do
  Begin
    availableList;
    UsedList;
  End;
end;

procedure TCadSuInstitutionTemp.UsedList;
Var
  I : Integer;
  RegInterface : TModule;
begin
  Institution.Module.getUsedList(Institution.Registro.Codigo);
  with self.cds_used, Institution  do
  Begin
    if not cds_used.Active then CreateDataSet;
    LogChanges := False;
    cds_used.EmptyDataSet;
    for I := 0 to Module.Lista.Count - 1 do
    Begin
      RegInterface := Module.Lista[I];
      Append;
      FieldByName('id').AsInteger           := RegInterface.Codigo;
      FieldByName('description').AsString  := RegInterface.Descricao;
      Post;
    End;
    LogChanges := True;
  End;

end;

end.
