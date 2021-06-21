unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uniPageControl,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniScrollBox, uniPanel,
  uniGUIBaseClasses, uniLabel, uniButton, DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr,uniBasicGrid, uniDBGrid,
   uniGUIFrame,  sea_iteration, FireDAC.Comp.Client, sea_interation, uniBitBtn,
  uniSpeedButton;

type
  TMainForm = class(TUniForm)
    pnl_body: TUniPanel;
    pnl_Top: TUniPanel;
    pnl_modules: TUniPanel;
    Sb_called_open: TUniSpeedButton;
    pg_Principal: TUniPageControl;
    tbs_called_list: TUniTabSheet;
    SQLConnect: TSQLConnection;
    lb_email_usuario: TUniLabel;
    Lb_NomeEmpresa: TUniLabel;
    Lb_data: TUniLabel;
    Sb_Close: TUniSpeedButton;
    procedure Sb_called_openClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure Sb_CloseClick(Sender: TObject);
    procedure ViewCallDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure NovaAba(pOrder:Integer);
    procedure VerificaAba(Sender: TObject; var AllowClose: Boolean);
    procedure ShowSeaIteration;
    procedure initVariables;
    procedure formatScreen;
    function validaViewCall:Boolean;
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, cad_interation;

function MainForm: TMainForm;
begin
  Result := TMainForm(UMM.GetFormInstance(TMainForm));
end;


procedure TMainForm.formatScreen;
begin
  lb_email_usuario.caption  := concat('Usuário: ',UniApplication.Cookies.Values['_email']);
  Lb_NomeEmpresa.Caption    := concat('Empresa: ' + UniApplication.Cookies.Values['_empresa']);
  Lb_data.Caption           := concat('Data: ',DateToStr(Date));
end;

procedure TMainForm.initVariables;
begin
  if not UMM.DB.Connected then  UMM.DB.Connected := True;
  ShowSeaIteration;
end;


procedure TMainForm.Sb_called_openClick(Sender: TObject);
var
 form : TCadInteration;
begin
 form := TCadInteration.create(UniApplication);
 Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if form.Iteration.Registro.codigo > 0 then
          NovaAba(form.Iteration.Registro.Ordem);
      form := nil;
    end
  );
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
  FormatScreen;
  initVariables;
end;

function TMainForm.validaViewCall: Boolean;
begin
  REsult := True;
end;

procedure TMainForm.VerificaAba(Sender: TObject; var AllowClose: Boolean);
begin
  if pg_Principal.PageCount = 1 then
    pg_Principal.Visible := False;
end;

procedure TMainForm.ViewCallDblClick(Sender: TObject);
Var
  LcCodigo : Integer;
begin
  LcCodigo := TUniDBGrid(Sender).DataSource.DataSet.FieldByName('ordem').AsInteger;
  NovaAba(LcCodigo);
end;

procedure TMainForm.NovaAba(pOrder:Integer);
var
  LcTbs   :TUniTabSheet;
  LcPgCount : Integer;
  Form : TSeaInteration;
begin
  LcPgCount := pg_Principal.PageCount;
  LcTbs := TUniTabSheet.Create(Pg_Principal);
  lcTbs.Name := concat('tbs_', intToStr(LcPgCount));
  lcTbs.Closable := True;
  LcTbs.PageControl := Pg_Principal;
  LcTbs.Caption:= concat('ATENDIMENTO N: ',pOrder.toString) ;
  Form := TSeaInteration.create(LcTbs);
  Form.Parent := LcTbs;
  Form.CodigoRegistro := pOrder;
  Form.search;
  Form.Show;
  pg_Principal.ActivePage := LcTbs;
end;

procedure TMainForm.Sb_CloseClick(Sender: TObject);
begin
  UniApplication.Cookies.SetCookie('_loginname','',Date-1);
  UniApplication.Cookies.SetCookie('_pwd','',Date-1);
  UniApplication.Restart;
end;

procedure TMainForm.ShowSeaIteration;
var
  Form : TSeaIteration;
begin
  Form := TSeaIteration.Create(tbs_called_list);
  Form.Parent := tbs_called_list;
  Form.search;
  Form.Show;
  Form.Dbg_search.OnDblClick := ViewCallDblClick;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
