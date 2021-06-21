unit tas_user_has_privilege;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, Vcl.Menus, uniMainMenu, Data.DB, Datasnap.DBClient,
  uniBasicGrid, uniDBGrid, MainModule, uniButton, uniBitBtn, uniSpeedButton;

type
  TTasUserHasPrivilege = class(TBaseForm)
    pnl_fundos: TUniPanel;
    dbg_modules: TUniDBGrid;
    cds_modules: TClientDataSet;
    cds_modulesid: TIntegerField;
    cds_modulesdescription: TStringField;
    ds_modules: TDataSource;
    cds_interfaces: TClientDataSet;
    ds_interfaces: TDataSource;
    dbg_interface: TUniDBGrid;
    pnl_buttons: TUniPanel;
    dbg_privilege: TUniDBGrid;
    Sb_Close: TUniSpeedButton;
    cds_privilege: TClientDataSet;
    ds_privilege: TDataSource;
    cds_interfacesid: TIntegerField;
    cds_interfacesdescription: TStringField;
    cds_privilegeid: TIntegerField;
    cds_privilegedescription: TStringField;
    cds_privilegeactive: TStringField;
    Sb_Apply: TUniSpeedButton;
    Sb_Cancel: TUniSpeedButton;
    procedure cds_modulesAfterScroll(DataSet: TDataSet);
    procedure Sb_CloseClick(Sender: TObject);
    procedure cds_interfacesAfterScroll(DataSet: TDataSet);
    procedure Sb_ApplyClick(Sender: TObject);
    procedure cds_privilegeAfterPost(DataSet: TDataSet);
    procedure Sb_CancelClick(Sender: TObject);
  private
    { Private declarations }
    Procedure ShowModules;
    Procedure ShowInterfaces;
    Procedure Showprivileges;
    procedure SavePrivilege;
    procedure StatusButton(Enab:Boolean);
  protected

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;

  public
    { Public declarations }
  end;

var
  TasUserHasPrivilege: TTasUserHasPrivilege;

implementation

{$R *.dfm}

{ TTasUserHasPrivilege }

procedure TTasUserHasPrivilege.cds_interfacesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  Showprivileges;
  StatusButton(False);
end;

procedure TTasUserHasPrivilege.cds_modulesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ShowInterfaces;
  cds_interfacesAfterScroll(cds_interfaces);
end;

procedure TTasUserHasPrivilege.cds_privilegeAfterPost(DataSet: TDataSet);
begin
  inherited;
  StatusButton(True);
end;

procedure TTasUserHasPrivilege.FormatScreen;
begin
  inherited;

end;

procedure TTasUserHasPrivilege.InitVariable;
begin
  inherited;

end;

procedure TTasUserHasPrivilege.SavePrivilege;
begin
  try
    Self.showMask('Salvando privilégios');
    UniSession.Synchronize();
    with self.cds_privilege, UMM.GInstitution.User  do
    Begin
      First;
      while not eof do
      Begin
        HasPrivilegio.clear;
        HasPrivilegio.Registro.Estabelecimento  := UMM.GInstitution.Registro.Codigo;
        HasPrivilegio.Registro.Usuario          := UMM.GInstitution.User.Registro.Codigo;
        HasPrivilegio.Registro.TelaInterface    := cds_interfacesid.AsInteger;
        HasPrivilegio.Registro.Privilegio       := cds_privilegeid.AsInteger;
        HasPrivilegio.Registro.Ativo            := cds_privilegeactive.AsString;
        HasPrivilegio.save;
        Next;
      End;
    End;
  finally
    self.HideMask;
  end;
end;

procedure TTasUserHasPrivilege.Sb_ApplyClick(Sender: TObject);
begin
  SavePrivilege;
  StatusButton(False);
end;

procedure TTasUserHasPrivilege.Sb_CancelClick(Sender: TObject);
begin
  Showprivileges;
  StatusButton(False);
end;

procedure TTasUserHasPrivilege.Sb_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TTasUserHasPrivilege.setImages;
begin
  inherited;
  buttonIcon(Sb_Apply,'confirm.bmp');
  buttonIcon(Sb_Cancel,'cancel.bmp');
  buttonIcon(Sb_Close,'close.bmp');
end;

procedure TTasUserHasPrivilege.SetVariable;
begin
  inherited;
  ShowModules;
  cds_modulesAfterScroll(cds_modules);
end;

procedure TTasUserHasPrivilege.ShowInterfaces;
Var
  I : Integer;
begin
  if cds_modules.active then
  Begin
    if cds_modulesid.AsInteger >0 then
    Begin
      cds_interfaces.AfterScroll := nil;
      UMM.GInstitution.Module.Interfaces.getUsedList(cds_modulesid.AsInteger,'');
      with self.cds_interfaces, UMM.GInstitution.Module.Interfaces  do
      Begin
        Active := False;
        CreateDataSet;
        EmptyDataSet;
        LogChanges := False;
        DisableControls;
        for I := 0 to Lista.Count - 1 do
        Begin
          Append;
          FieldByName('id').AsInteger         := Lista[I].Codigo;
          FieldByName('description').AsString := Lista[I].Descricao;
          Post;
        End;
        First;
        LogChanges := True;
        EnableControls;
      End;
      cds_interfaces.AfterScroll := cds_interfacesAfterScroll;
    End;
  End;
end;

procedure TTasUserHasPrivilege.ShowModules;
Var
  I : Integer;
begin
  UMM.GInstitution.Module.getUsedList(UMM.GInstitution.Registro.Codigo);
  cds_modules.AfterScroll := nil;
  with self.cds_modules, UMM.GInstitution.Module  do
  Begin
    Active := False;
    CreateDataSet;
    EmptyDataSet;
    LogChanges := False;
    DisableControls;
    for I := 0 to Lista.Count - 1 do
    Begin
      if Lista[I].Descricao <> 'Sair' then
      Begin
        Append;
        FieldByName('id').AsInteger         := Lista[I].Codigo;
        FieldByName('description').AsString := Lista[I].Descricao;
        Post;
      End;
    End;
    First;
    LogChanges := True;
    EnableControls;
  End;
  cds_modules.AfterScroll := cds_modulesAfterScroll;
end;

procedure TTasUserHasPrivilege.Showprivileges;
Var
  I : Integer;
begin
  UMM.GInstitution.User.Parametro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  UMM.GInstitution.User.Parametro.Usuario         := UMM.GInstitution.User.Registro.Codigo;
  UMM.GInstitution.User.Parametro.TelaInterface   := cds_interfacesid.AsInteger;
  UMM.GInstitution.User.getListprivilege;

  with self.cds_privilege, UMM.GInstitution.User  do
  Begin
    Active := False;
    CreateDataSet;
    EmptyDataSet;
    LogChanges := False;
    DisableControls;
    for I := 0 to ListaPrivilegio.Count - 1 do
    Begin
      Append;
      FieldByName('id').AsInteger         := ListaPrivilegio[I].Codigo;
      FieldByName('description').AsString := ListaPrivilegio[I].Descricao;
      FieldByName('active').AsString      := ListaPrivilegio[I].Ativo;
      Post;
    End;
    First;
    LogChanges := True;
    EnableControls;
  End;
end;

procedure TTasUserHasPrivilege.StatusButton(Enab: Boolean);
begin
  Sb_Apply.Enabled := Enab;
  Sb_Cancel.Enabled := Enab;
end;

end.
