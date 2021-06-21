unit tas_order_job_scope;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel, uniMemo, fm_work_front, uniDateTimePicker,
  ControllerOrderJobScope, MainModule, unMessages, Data.DB, Datasnap.DBClient,
  base_form;

type
  TTasOrderJobScope = class(TBaseForm)
    pnl_fundo: TUniPanel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_Detail: TUniMemo;
    UniLabel1: TUniLabel;
    Ctn_WorkFront: TUniContainerPanel;
    L_DtRegistry: TUniLabel;
    Dtp_Forecast: TUniDateTimePicker;
    E_Vl_Forecast: TUniEdit;
    UniLabel2: TUniLabel;
    pnl_botao: TUniPanel;
    SB_Save: TUniSpeedButton;
    SB_Cancel: TUniSpeedButton;
    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure FormatScreen;Override;
    procedure ShowData;Virtual;
    procedure ShowNoData;Virtual;
    procedure SB_CancelClick(Sender: TObject);
    procedure setImages;Override;
    procedure SB_SaveClick(Sender: TObject);
  private
    { Private declarations }
    frWorkFront : TFmWorkFront;
    function ValidateSave: boolean;Virtual;
    procedure Save;Virtual;
  protected
    procedure ShowWorkFront;
  public
    { Public declarations }
    Scope : TControllerOrderJobScope;
    EditionState : String;
    cds_Item: TClientDataSet;
  end;

var
  TasOrderJobScope: TTasOrderJobScope;

implementation

{$R *.dfm}

{ TTasOrderJobScope }

procedure TTasOrderJobScope.ShowData;
begin
  with cds_Item do
  Begin
    E_Description.Text                := FieldByName('description').AsString;
    E_Detail.Text                     := FieldByName('note').AsString;
    frWorkFront.DBLCB_Lista.KeyValue  := FieldByName('tb_work_front_id').AsInteger;
    Dtp_Forecast.DateTime             := FieldByName('dt_forecast').AsDateTime;
    E_Vl_Forecast.Text                := FloatToStrF(FieldByName('value_forecast').Asfloat,ffFixed,10,2);
  End;
end;

procedure TTasOrderJobScope.ShowNoData;
begin
  inherited;
  ClearFields(FrWorkFront);
end;

procedure TTasOrderJobScope.ShowWorkFront;
begin
  frWorkFront := TFmWorkFront.Create(Self);
  frWorkFront.Parent := Ctn_WorkFront;
  frWorkFront.Align := alClient;
  frWorkFront.Listar;
  frWorkFront.Show;
end;

function TTasOrderJobScope.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_Description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
  if (trim(frWorkFront.DBLCB_Lista.Text) = '') or (frWorkFront.DBLCB_Lista.KeyValue = null) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Frente de Trabalho não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

procedure TTasOrderJobScope.FormatScreen;
begin
  inherited;
  ShowWorkFront;

end;

procedure TTasOrderJobScope.InitVariable;
begin
  inherited;
  Scope := TControllerOrderJobScope.Create(Self);
end;

procedure TTasOrderJobScope.Save;
begin
  with self.cds_Item do
  Begin
    if not Active then createDataset;
    if EditionState = 'I' then
    Begin
      Append;
      FieldByName('id').AsInteger := 0;
      FieldByName('tb_institution_id').AsInteger :=  UMM.GInstitution.registro.Codigo;
      FieldByName('tb_order_id').AsInteger := 0;
    End
    else
    Begin
      Edit;
    End;
    FieldByName('description').AsString       := E_Description.Text;
    FieldByName('tb_work_front_id').AsInteger := frWorkFront.DBLCB_Lista.KeyValue;
    FieldByName('note').AsString              := E_Detail.Text;
    if Dtp_Forecast.Text = '30/12/1899' then
      FieldByName('dt_forecast').AsDateTime   := 0.0
    else
      FieldByName('dt_forecast').AsDateTime   := Dtp_Forecast.DateTime;
    FieldByName('dt_forecast').AsDateTime     := Dtp_Forecast.DateTime;
    FieldByName('value_forecast').AsFloat     := StrToFloatDef(E_Vl_Forecast.Text,0);
    FieldByName('workfront').AsString         := frWorkFront.DBLCB_Lista.Text;
    Post;
    Active := False;
    Active := True;
  End;
end;

procedure TTasOrderJobScope.SB_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TTasOrderJobScope.SB_SaveClick(Sender: TObject);
begin
  if validateSave then
  begin
    Save;
    Close;
  end;
end;

procedure TTasOrderJobScope.setImages;
begin
  inherited;
  buttonIcon(Sb_Save,'save.bmp');
  buttonIcon(Sb_Cancel,'cancel.bmp');
end;

procedure TTasOrderJobScope.setVariable;
begin
  if EditionState = 'I' then
  Begin
    ShowNoData;
  End
  else
  Begin
    ShowData;
  End;
  UniSession.AddJS('setTimeout(function(){'+ E_Description.JSName +'.focus()}, 100)');
end;

end.
