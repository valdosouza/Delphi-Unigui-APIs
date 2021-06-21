unit base_registry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniGUIBaseClasses,UniDBGrid,
  uniGUIClasses, uniPanel, Vcl.Buttons, uniButton, uniBitBtn, uniSpeedButton,
  uniScrollBox, Vcl.Menus, uniMainMenu, uniLabel, UniEdit,UniCheckBox,UniComboBox,
  UniRadioGroup, UniDateTimePicker, UniTreeView, UniMemo,UniDBLookupComboBox,
  Data.DB, Datasnap.DBClient;

type
  TBaseRegistry = class(TBaseForm)
    pnl_botao: TUniPanel;
    SB_Insert: TUniSpeedButton;
    SB_Change: TUniSpeedButton;
    SB_Delete: TUniSpeedButton;
    SB_Save: TUniSpeedButton;
    SB_Cancel: TUniSpeedButton;
    Sb_Close: TUniSpeedButton;
    pnl_fundo: TUniPanel;
    procedure SB_InsertClick(Sender: TObject);
    procedure SB_ChangeClick(Sender: TObject);
    procedure SB_DeleteClick(Sender: TObject);
    procedure SB_SaveClick(Sender: TObject);
    procedure SB_CancelClick(Sender: TObject);
    procedure Sb_CloseClick(Sender: TObject);
  private
  protected
    function getNextIdDataSet(cds: TClientDataSet): Integer;
    //Variaveis
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure setPrivilege;Override;
    procedure FormatScreen;Override;
    //Teclas de atalhos
    procedure execShorCutKeyF2;Override;
    procedure execShorCutKeyF3;Override;
    procedure execShorCutKeyF4;Override;
    procedure execShorCutKeyF5;Override;
    procedure execShorCutKeyF6;Override;

    procedure ShowData;Virtual;
    procedure ShowNoData;Virtual;
    procedure ClearAllFields;Virtual;
    //inserir
    function ValidaInsert():boolean;Virtual;
    procedure Insert;Virtual;
    //Editar
    function ValidateChange():boolean;Virtual;
    procedure Change;Virtual;
    //Deletar
    function ValidateDelete():boolean;Virtual;
    procedure Delete;Virtual;
    //Salvar
    function ValidateSave():boolean;Virtual;
    procedure Save;Virtual;
    //Cancelar
    function ValidateCancel():boolean;Virtual;
    procedure Cancel;Virtual;

    procedure EditionControl;Virtual;

  public
    EditionState : String;

    procedure EditionControler(T: TComponent);
  end;

var
  BaseRegistry: TBaseRegistry;

implementation

{$R *.dfm}

uses unMessages, UnFunctions, MainModule;

procedure TBaseRegistry.Change;
begin
//
end;

procedure TBaseRegistry.Cancel;
begin
  if (EditionState = 'I') then
  Begin
    ClearAllFields;
    Self.Close;
  End
  else
  Begin
    ShowData;
  End;
end;

procedure TBaseRegistry.EditionControler(T: TComponent);
Var
  I,J:Integer;
begin
  with T do
  Begin
    for I := 0 to ((ComponentCount)-3) do
    begin

      if ( Components[I].name <> '' ) and assigned(Components[I]) then
      Begin
        try
          if (Components[I].ClassName = 'TUniEdit') then
          Begin
            if TUniEdit (Components[I]).Name = 'E_ID' then
              TUniEdit (Components[I]).ReadOnly := True
            else
              TUniEdit (Components[I]).ReadOnly := ( EditionState = 'B' );
          End;

          if (Components[I].ClassName = 'TUniNumberEdit') then
           TUniNumberEdit (Components[I]).ReadOnly := ( EditionState = 'B' );

          if (Components[I].ClassName = 'TUniDBLookupComboBox') then
            TUniDBLookupComboBox (Components[I]).ReadOnly := ( EditionState = 'B' );

          if (Components[I].ClassName = 'TUniMemo') then
            TUniMemo (Components[I]).ReadOnly := ( EditionState = 'B' );

          if (Components[I].ClassName = 'TUniCheckBox') then
            TUniCheckBox (Components[I]).ReadOnly := ( EditionState = 'B' );

          if (Components[I].ClassName = 'TUniComboBox') then
            TUniComboBox (Components[I]).ReadOnly := ( EditionState = 'B' );

          if (Components[I].ClassName = 'TUniDateTimePicker') then
          Begin
            TUniDateTimePicker (Components[I]).USeSystemFormats := True;
            TUniDateTimePicker (Components[I]).ReadOnly := ( EditionState = 'B' );
          End;

          if (Components[I].ClassName = 'TUniTreeView') then
            TUniTreeView (Components[I]).Enabled := ( EditionState = 'B' );

          if (Components[I].ClassName = 'TUniDBGrid') then
            TUniDBGrid (Components[I]).ReadOnly := ( EditionState = 'B' );

          if (Components[I].ClassName = 'TUniSpeedButton') then
            TUniSpeedButton (Components[I]).Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );

          if (Components[I].ClassName = 'TUniRadioGroup') then
          Begin
            TUniRadioGroup (Components[I]).ReadOnly := ( EditionState = 'B' );
          End;
        except
          break;
        End;
      End;
    end;
  End;
end;

procedure TBaseRegistry.execShorCutKeyF2;
begin
  if SB_Insert.Enabled then SB_InsertClick(Self);
end;

procedure TBaseRegistry.execShorCutKeyF3;
begin
  if SB_Change.Enabled then SB_ChangeClick(Self);
end;

procedure TBaseRegistry.execShorCutKeyF4;
begin
  if SB_Delete.Enabled then SB_DeleteClick(Self);
end;

procedure TBaseRegistry.execShorCutKeyF5;
begin
  if SB_Save.Enabled then SB_SaveClick(Self);
end;

procedure TBaseRegistry.execShorCutKeyF6;
begin
  if SB_Cancel.Enabled then SB_CancelClick(Self);
end;

procedure TBaseRegistry.EditionControl;
Var
  I,J:Integer;
begin
  EditionControler(Self);
  SB_Insert.Enabled := ( EditionState = 'B' ) and PInsert;
  SB_Change.Enabled := ( EditionState = 'B' ) and ( CodigoRegistro > 0 ) and pUpdate;
  SB_Delete.Enabled := ( EditionState = 'B' ) and ( CodigoRegistro > 0 ) and PDelete;
  SB_Save.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
  SB_Cancel.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
  Sb_Close.Enabled := ( EditionState = 'B' );
end;

procedure TBaseRegistry.Delete;
begin
  //A implementação será feita na descendencia
end;

procedure TBaseRegistry.FormatScreen;
begin
  inherited;
  //A implementação será feita na descendencia
end;

function TBaseRegistry.getNextIdDataSet(cds: TClientDataSet): Integer;
Var
  Marcador : TBookmark;
begin
 with cds do
  Begin
    if not cds.Active then cds.createDataset;
    marcador:= GetBookmark;
    try
      DisableControls;
      Result := 0;
      try
        filtered :=False;
        First;
        while not Eof do
        begin
          if FieldByName('id').AsInteger >Result then
            Result :=  fieldbyname('id').AsInteger;
          Next;
        end;
      finally
        filtered :=True;
        EnableControls;
      end;
    finally
      GotoBookmark(marcador);
      FreeBookmark(marcador);
    end;
  End;
  inc(Result);
end;

procedure TBaseRegistry.showData;
begin
  //A implementação será feita na descendencia
end;

procedure TBaseRegistry.showNoData;
begin
  //A implementação será feita na descendencia
end;

procedure TBaseRegistry.Save;
begin
  //A implementação será feita na descendencia
end;

procedure TBaseRegistry.InitVariable;
begin
  inherited;
  //A implementação será feita na descendencia
end;

procedure TBaseRegistry.Insert;
begin
  //A implementação será feita na descendencia
end;

function TBaseRegistry.ValidateChange: boolean;
begin
  Result := True;
end;

function TBaseRegistry.ValidateCancel: boolean;
begin
  Result := True;
end;

function TBaseRegistry.ValidateDelete: boolean;
begin
  Result := True;
end;

function TBaseRegistry.ValidateSave: boolean;
begin
  Result := True;
end;

procedure TBaseRegistry.ClearAllFields;
Begin
  ClearFields(self);
End;

function TBaseRegistry.ValidaInsert: boolean;
begin
  Result := True;
end;

procedure TBaseRegistry.SB_ChangeClick(Sender: TObject);
begin
  if ValidateChange then
  Begin
    EditionState := 'E';
    EditionControl;
    Change;
  End;
end;

procedure TBaseRegistry.Sb_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TBaseRegistry.SB_CancelClick(Sender: TObject);
begin
  if ValidateCancel then
  Begin
    Cancel;
    EditionState := 'B';
    EditionControl;
  End;
end;

procedure TBaseRegistry.SB_DeleteClick(Sender: TObject);
begin
  if ValidateDelete then
  Begin
    Delete;
    EditionState := 'B';
    EditionControl;
  End;
end;

procedure TBaseRegistry.SB_SaveClick(Sender: TObject);
begin
  if ValidateSave then
  Begin
    try
      Self.showMask('Salvando dados...');
      Save;
      EditionState := 'B';
      EditionControl;
    finally
      self.HideMask;
    end;
  End;
end;

procedure TBaseRegistry.SB_InsertClick(Sender: TObject);
begin
  if ValidaInsert then
  Begin
    EditionState := 'I';
    EditionControl;
    Insert;
  End;
end;


procedure TBaseRegistry.setImages;
begin
  inherited;
  buttonIcon(SB_Insert,'insert.bmp');
  buttonIcon(SB_Change,'change.bmp');
  buttonIcon(Sb_Delete,'delete.bmp');
  buttonIcon(Sb_Save,'save.bmp');
  buttonIcon(Sb_Cancel,'cancel.bmp');
  buttonIcon(Sb_Close,'close.bmp');
end;

procedure TBaseRegistry.setPrivilege;
begin
  PInsert := UMM.GInstitution.User.getPrivilege('INSERIR');
  PUpdate := UMM.GInstitution.User.getPrivilege('ALTERAR');
  PDelete := UMM.GInstitution.User.getPrivilege('EXCLUIR');
end;

procedure TBaseRegistry.SetVariable;
begin
  if ( CodigoRegistro > 0 ) then
    ShowData
  else
    ShowNoData;
  EditionState := 'B';
  EditionControl;
end;



end.
