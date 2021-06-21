unit tas_useful_phone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniGroupBox, uniBasicGrid, uniDBGrid, uniEdit, uniLabel,
  uniMultiItem, uniComboBox, ControllerPhone, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, ControllerEntity;

type
  TTasUsefulPhone = class(TBaseRegistry)
    UniGroupBox1: TUniGroupBox;
    L_NameCompany: TUniLabel;
    E_Description_s: TUniEdit;
    dbg_Search: TUniDBGrid;
    UniGroupBox2: TUniGroupBox;
    UniLabel2: TUniLabel;
    E_Description: TUniEdit;
    cb_Type: TUniComboBox;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    E_phone: TUniEdit;
    cds_search: TClientDataSet;
    ds_search: TDataSource;
    sb_a: TUniSpeedButton;
    sb_b: TUniSpeedButton;
    sb_c: TUniSpeedButton;
    sb_d: TUniSpeedButton;
    sb_e: TUniSpeedButton;
    sb_f: TUniSpeedButton;
    sb_g: TUniSpeedButton;
    sb_h: TUniSpeedButton;
    sb_i: TUniSpeedButton;
    sb_j: TUniSpeedButton;
    sb_k: TUniSpeedButton;
    sb_l: TUniSpeedButton;
    sb_m: TUniSpeedButton;
    sb_n: TUniSpeedButton;
    sb_o: TUniSpeedButton;
    sb_p: TUniSpeedButton;
    sb_q: TUniSpeedButton;
    sb_r: TUniSpeedButton;
    sb_s: TUniSpeedButton;
    sb_t: TUniSpeedButton;
    sb_u: TUniSpeedButton;
    sb_v: TUniSpeedButton;
    sb_w: TUniSpeedButton;
    sb_x: TUniSpeedButton;
    sb_y: TUniSpeedButton;
    sb_z: TUniSpeedButton;
    cds_searchkind: TStringField;
    cds_searchcontact: TStringField;
    cds_searchnumber: TStringField;
    cds_searchid: TIntegerField;
    UniSpeedButton1: TUniSpeedButton;

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowListPhone;
    procedure ShowContact;
    procedure SetContact;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure SaveMemoryTable;
    Procedure SaveDatabase;
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
    procedure dbg_SearchCellClick(Column: TUniDBGridColumn);

    procedure GeralSearch(sb_letra :TUniSpeedButton);
    Procedure SbColor;

    procedure sb_bClick(Sender: TObject);
    procedure sb_cClick(Sender: TObject);
    procedure sb_dClick(Sender: TObject);
    procedure sb_eClick(Sender: TObject);
    procedure sb_fClick(Sender: TObject);
    procedure sb_gClick(Sender: TObject);
    procedure sb_hClick(Sender: TObject);
    procedure sb_iClick(Sender: TObject);
    procedure sb_jClick(Sender: TObject);
    procedure sb_kClick(Sender: TObject);
    procedure sb_lClick(Sender: TObject);
    procedure sb_mClick(Sender: TObject);
    procedure sb_nClick(Sender: TObject);
    procedure sb_oClick(Sender: TObject);
    procedure sb_pClick(Sender: TObject);
    procedure sb_qClick(Sender: TObject);
    procedure sb_rClick(Sender: TObject);
    procedure sb_sClick(Sender: TObject);
    procedure sb_tClick(Sender: TObject);
    procedure sb_uClick(Sender: TObject);
    procedure sb_vClick(Sender: TObject);
    procedure sb_wClick(Sender: TObject);
    procedure sb_xClick(Sender: TObject);
    procedure sb_yClick(Sender: TObject);
    procedure sb_zClick(Sender: TObject);

    procedure EditionControl;Override;
    procedure sb_aClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure E_phoneKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SB_ChangeClick(Sender: TObject);
    


  private
    { Private declarations }
  public
    { Public declarations }
    Entity : TControllerEntity;

  end;

var
  TasUsefulPhone: TTasUsefulPhone;

implementation

{$R *.dfm}

uses tblPhone, MainModule, UnFunctions;

{ TBaseRegistry1 }

procedure TTasUsefulPhone.GeralSearch(sb_letra: TUniSpeedButton);
var
  Lc_Sqltxt:string;
  Lc_Letra : String;
begin
  Screen.Cursor := crHourGlass;
  with cds_search do
  Begin
    SbColor;
    sb_letra.Font.Color := clRed;
    Lc_Letra := sb_letra.Caption;
    Lc_Sqltxt := '';
    Screen.Cursor:=crHourGlass;
    Close;
    Filtered := False;
    Filter := concat(' ( contact like ', QuotedStr(lc_letra + '%'), ') ');
    Filtered := True;

    Open;
  end;
  Screen.Cursor := crDefault;
end;

procedure TTasUsefulPhone.ClearAllFields;
begin
  inherited;
  Entity.clear;
  Entity.Telefone.clear;
  ClearFields(cb_Type);
  ClearFields(E_Description);
  ClearFields(E_phone);
end;

procedure TTasUsefulPhone.dbg_SearchCellClick(Column: TUniDBGridColumn);
begin
  SetContact;
  ShowContact;
  EditionControl;
end;

procedure TTasUsefulPhone.Delete;
begin
  inherited;
  //
end;

procedure TTasUsefulPhone.EditionControl;
Var
  I,J:Integer;
begin
  SB_Insert.Enabled := ( EditionState = 'B' );
  SB_Change.Enabled := ( EditionState = 'B' ) and ( CodigoRegistro > 0 );
  SB_Delete.Enabled := ( EditionState = 'B' ) and ( CodigoRegistro > 0 );
  SB_Save.Enabled   := ( EditionState = 'I' ) or ( EditionState = 'E' );
  SB_Cancel.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
  Sb_Close.Enabled  := ( EditionState = 'B' );
end;


procedure TTasUsefulPhone.E_phoneKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MaskPhone(Sender as TUniEdit);
end;

procedure TTasUsefulPhone.FormatScreen;
begin
  inherited;
//
end;

procedure TTasUsefulPhone.InitVariable;
begin
  inherited;
  Entity := TControllerEntity.Create(self);
end;

procedure TTasUsefulPhone.Insert;
begin
  inherited;
  ClearAllFields;
  EditionState := 'I';
end;

procedure TTasUsefulPhone.Save;
begin
  inherited;
  SaveMemoryTable;
  SaveDatabase;
end;

procedure TTasUsefulPhone.SaveDatabase;
begin
  Entity.Registro.NomeRazao  := E_Description.Text;
  Entity.save;

  with Entity.Telefone do
  Begin
    Registro.Codigo  := Entity.Registro.Codigo;
    Registro.Contato := Entity.Registro.NomeRazao;
    Registro.Numero  := unMaskField(E_phone.Text);
    Registro.Tipo    := cb_Type.Text;
    save;
  End;
end;

procedure TTasUsefulPhone.SaveMemoryTable;
begin
  with self.cds_search do
  Begin
    if not Active then createDataset;
    if EditionState = 'E' then
      edit
    else
      Append;
    
    FieldByName('kind').asString              := cb_Type.Text;
    FieldByName('contact').AsString           := E_Description.Text;
    FieldByName('number').AsString            := E_phone.Text;

    Post;
    Active := False;
    Active := True;
    Filtered := False;
  End;
end;

procedure TTasUsefulPhone.SbColor;
Begin
  SB_A.Font.Color := clBlack;
  SB_B.Font.Color := clBlack;
  SB_C.Font.Color := clBlack;
  SB_D.Font.Color := clBlack;
  SB_E.Font.Color := clBlack;
  SB_F.Font.Color := clBlack;
  SB_G.Font.Color := clBlack;
  SB_H.Font.Color := clBlack;
  SB_I.Font.Color := clBlack;
  SB_J.Font.Color := clBlack;
  SB_K.Font.Color := clBlack;
  SB_L.Font.Color := clBlack;
  SB_M.Font.Color := clBlack;
  SB_N.Font.Color := clBlack;
  SB_O.Font.Color := clBlack;
  SB_P.Font.Color := clBlack;
  SB_Q.Font.Color := clBlack;
  SB_R.Font.Color := clBlack;
  SB_S.Font.Color := clBlack;
  SB_T.Font.Color := clBlack;
  SB_U.Font.Color := clBlack;
  SB_V.Font.Color := clBlack;
  SB_X.Font.Color := clBlack;
  SB_Y.Font.Color := clBlack;
  SB_W.Font.Color := clBlack;
  SB_Z.Font.Color := clBlack;
end;

procedure TTasUsefulPhone.sb_aClick(Sender: TObject);
begin
  GeralSearch(sb_a);
end;

procedure TTasUsefulPhone.sb_bClick(Sender: TObject);
begin
  GeralSearch(sb_b);
end;

procedure TTasUsefulPhone.sb_cClick(Sender: TObject);
begin
  GeralSearch(sb_c);
end;

procedure TTasUsefulPhone.SB_ChangeClick(Sender: TObject);
begin
  inherited;
  EditionState := 'E';
end;

procedure TTasUsefulPhone.sb_dClick(Sender: TObject);
begin
  GeralSearch(sb_d);
end;

procedure TTasUsefulPhone.sb_eClick(Sender: TObject);
begin
  GeralSearch(sb_e);

end;

procedure TTasUsefulPhone.sb_fClick(Sender: TObject);
begin
  GeralSearch(sb_f);
end;

procedure TTasUsefulPhone.sb_gClick(Sender: TObject);
begin
  GeralSearch(sb_g);

end;

procedure TTasUsefulPhone.sb_hClick(Sender: TObject);
begin
  GeralSearch(sb_h);
end;

procedure TTasUsefulPhone.sb_iClick(Sender: TObject);
begin
  GeralSearch(sb_i);
end;

procedure TTasUsefulPhone.sb_jClick(Sender: TObject);
begin
  GeralSearch(sb_j);
end;

procedure TTasUsefulPhone.sb_kClick(Sender: TObject);
begin
  GeralSearch(sb_k);
end;

procedure TTasUsefulPhone.sb_lClick(Sender: TObject);
begin
  GeralSearch(sb_l);
end;

procedure TTasUsefulPhone.sb_mClick(Sender: TObject);
begin
  GeralSearch(sb_m);
end;

procedure TTasUsefulPhone.sb_nClick(Sender: TObject);
begin
  GeralSearch(sb_n);
end;

procedure TTasUsefulPhone.sb_oClick(Sender: TObject);
begin
  GeralSearch(sb_o);
end;

procedure TTasUsefulPhone.sb_pClick(Sender: TObject);
begin
  GeralSearch(sb_p);
end;

procedure TTasUsefulPhone.sb_qClick(Sender: TObject);
begin
  GeralSearch(sb_q);
end;

procedure TTasUsefulPhone.sb_rClick(Sender: TObject);
begin
  GeralSearch(sb_r);
end;

procedure TTasUsefulPhone.sb_sClick(Sender: TObject);
begin
  GeralSearch(sb_s);
end;

procedure TTasUsefulPhone.sb_tClick(Sender: TObject);
begin
  GeralSearch(sb_t);
end;

procedure TTasUsefulPhone.sb_uClick(Sender: TObject);
begin
  GeralSearch(sb_u);
end;

procedure TTasUsefulPhone.sb_vClick(Sender: TObject);
begin
  GeralSearch(sb_v);
end;

procedure TTasUsefulPhone.sb_wClick(Sender: TObject);
begin
  GeralSearch(sb_w);
end;

procedure TTasUsefulPhone.sb_xClick(Sender: TObject);
begin
  GeralSearch(sb_x);
end;

procedure TTasUsefulPhone.sb_yClick(Sender: TObject);
begin
  GeralSearch(sb_y);
end;

procedure TTasUsefulPhone.sb_zClick(Sender: TObject);
begin
  GeralSearch(sb_z);
end;

procedure TTasUsefulPhone.SetContact;
begin
  CodigoRegistro := cds_search.FieldByName('id').AsInteger; 

  Entity.Registro.Codigo := CodigoRegistro;

  Entity.Telefone.Registro.Codigo := Entity.Registro.Codigo;
  Entity.Telefone.Registro.Tipo   := cds_search.FieldByName('kind').AsString;
  
end;

procedure TTasUsefulPhone.SetVariable;
begin
  ClearAllFields;
  ShowData;
  EditionState := 'B';
  EditionControl;
  
end;

procedure TTasUsefulPhone.ShowContact;
begin
  with cds_search do
  begin
    cb_Type.text                := FieldByName('kind').asString;
    E_phone.Text                := FieldByName('number').asString;
    MaskPhone(E_phone);
    E_Description.Text          := FieldByName('contact').asString;             ;
    
  end;
end;

procedure TTasUsefulPhone.ShowData;
begin
  ShowListPhone;
  cds_search.Filtered := False;
end;

procedure TTasUsefulPhone.ShowListPhone;
Var
  I : Integer;
  Registro : TPhone;
  LcOrderItem : TControllerPhone;
  LcEdit : TUniEdit;
begin
//  LcEdit :=  TUniEdit.Create(self);
//  LcOrderItem := TControllerPhone.create(Self);
//  LcOrderItem.InstitutionHasEntity.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
//  LcOrderItem.getList;
//
//  with cds_search  do
//  Begin
//    if not Active then CreateDataSet;
//    cds_search.LogChanges := False;
//    cds_search.EmptyDataSet;
//    for I := 0 to LcOrderItem.Lista.Count - 1 do
//    Begin
//      Registro := LcOrderItem.Lista[I];
//      Append;
//
//      FieldByName('id').AsInteger                 := Registro.Codigo;
//      FieldByName('kind').asString                := Registro.Tipo;
//      LcEdit.Text :=  Registro.Numero;
//      MaskPhone(LcEdit);
//      FieldByName('number').asString              := LcEdit.Text;
//      FieldByName('contact').asString             := Registro.Contato;
//
//    End;
//  End;
//  cds_search.LogChanges := True;
//  FreeAndNil(LcEdit);
end;

procedure TTasUsefulPhone.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasUsefulPhone.UniSpeedButton1Click(Sender: TObject);
begin
  cds_search.Filtered := False;
end;

function TTasUsefulPhone.ValidaInsert: boolean;
begin
//
end;

function TTasUsefulPhone.ValidateDelete: boolean;
begin
//
end;

function TTasUsefulPhone.ValidateSave: boolean;
begin
//
end;

end.
