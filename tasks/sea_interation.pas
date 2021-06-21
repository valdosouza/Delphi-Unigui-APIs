unit sea_interation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniPageControl,
  uniGUIBaseClasses, uniPanel, base_search, msg_form,unmessages,intInteration,
  cad_interation, uniGUIApplication, cad_interation_task, cad_interation_proposal,
  cad_interation_Progress, uniMultiItem, uniComboBox,controllerIteration;

type
  TSeaInteration = class(TFmBaseFrame)
    Dbg_call: TUniDBGrid;
    pnl_botao: TUniPanel;
    Sb_Inter_Comment: TUniButton;
    Sb_Inter_proposal: TUniButton;
    Sb_Inter_task: TUniButton;
    Progress: TUniButton;
    Sb_Inter_View: TUniButton;
    DSP: TDataSetProvider;
    cds_task: TClientDataSet;
    ds_task: TDataSource;
    Sb_Inter_Update: TUniButton;
    pc_main: TUniPageControl;
    tbs_call: TUniTabSheet;
    tbs_task: TUniTabSheet;
    tbs_proposal: TUniTabSheet;
    tbs_progress: TUniTabSheet;
    cds_call: TClientDataSet;
    ds_call: TDataSource;
    ds_proposal: TDataSource;
    cds_proposal: TClientDataSet;
    cds_progress: TClientDataSet;
    ds_progress: TDataSource;
    Dbg_Proposal: TUniDBGrid;
    Dbg_Task: TUniDBGrid;
    Dbg_Progress: TUniDBGrid;
    cds_calltb_institution_id: TIntegerField;
    cds_callid: TIntegerField;
    cds_calltb_order_id: TIntegerField;
    cds_callupdated_at: TDateTimeField;
    cds_callcomentario: TStringField;
    cds_callsituacao: TStringField;
    cds_callkind: TStringField;
    cds_calltb_customer_id: TIntegerField;
    cds_proposaltb_institution_id: TIntegerField;
    cds_proposalid: TIntegerField;
    cds_proposaltb_order_id: TIntegerField;
    cds_proposalupdated_at: TDateTimeField;
    cds_proposalcomentario: TStringField;
    cds_proposalsituacao: TStringField;
    cds_proposalkind: TStringField;
    cds_proposaltb_customer_id: TIntegerField;
    cds_tasktb_institution_id: TIntegerField;
    cds_taskid: TIntegerField;
    cds_tasktb_order_id: TIntegerField;
    cds_taskupdated_at: TDateTimeField;
    cds_taskcomentario: TStringField;
    cds_tasksituacao: TStringField;
    cds_taskkind: TStringField;
    cds_tasktb_customer_id: TIntegerField;
    cds_progresstb_institution_id: TIntegerField;
    cds_progressid: TIntegerField;
    cds_progresstb_order_id: TIntegerField;
    cds_progressupdated_at: TDateTimeField;
    cds_progresscomentario: TStringField;
    cds_progresssituacao: TStringField;
    cds_progresskind: TStringField;
    cds_progresstb_customer_id: TIntegerField;
    procedure Sb_Inter_ViewClick(Sender: TObject);
    procedure Sb_Inter_CommentClick(Sender: TObject);
    procedure Sb_Inter_UpdateClick(Sender: TObject);
    procedure Sb_Inter_taskClick(Sender: TObject);
    procedure Sb_Inter_proposalClick(Sender: TObject);
    procedure ProgressClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure setImages;Override;
    procedure initVariable;override;

    function validateDataSetOpen(cds:TClientDataSet):Boolean;
    function validateExistRegister(cds:TClientDataSet):Boolean;

    function validateGetView(cds:TClientDataSet):Boolean;
    procedure GetView;

    function validateSetComent(cds:TClientDataSet):Boolean;
    procedure setComent(cds:TClientDataSet);
    procedure DefineComment;
    procedure ViewComent;

    function validateSetProposal:Boolean;
    procedure SetProposal;
    procedure ViewProposal;

    function validateSetTask:Boolean;
    procedure SetTask(cds:TClientDataSet);
    procedure ViewTask;

    function validateSetProgress:Boolean;
    procedure SetProgress;
    procedure ViewProgress;

    procedure ChamadaIntereacao(CodigoID:Integer;obj:TcontrollerIteration;cds:TClientDataSet);

    procedure searchCall(par:TIntInteration);
    procedure searchProposal(par:TIntInteration);
    procedure searchTask(par:TIntInteration);
    procedure searchProgress(par:TIntInteration);
    procedure fillDataSet(cds:TClientDataSet);

  public
    { Public declarations }
    OrderID: Integer;
    ClienteID  : Integer;
    Iteration : TControllerIteration;
    procedure search;
  end;

var
  SeaInteration: TSeaInteration;

implementation

{$R *.dfm}

uses MainModule;

{ TBaseSearch1 }



procedure TSeaInteration.ChamadaIntereacao(CodigoID:Integer;obj: TcontrollerIteration;cds:TClientDataSet);
begin
  //Informar o master_ID e a Ordem quando for uma resposta na iteração
  with obj.HasInteration.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Ordem    := cds.FieldByName('tb_order_id').AsInteger;
    MasterId := cds.FieldByName('id').AsInteger;
  End;
  obj.Registro.Codigo := CodigoID;//Essa variavel completa se estaremos editando ou inserindo uma nova interação
  obj.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  obj.Registro.Ordem := cds.FieldByName('tb_order_id').AsInteger;
  obj.Registro.Cliente := cds.FieldByName('tb_customer_id').AsInteger;
end;

procedure TSeaInteration.GetView;
begin
  case pc_main.ActivePageIndex of
   0: BEgin
        if  validateGetView(cds_call) then
          ViewComent;
      End;
   1: BEgin
        if  validateGetView(cds_proposal) then
          ViewProposal;
      End;
   2: Begin
        if  validateGetView(cds_task) then
          ViewTask;
      End;
   3: BEgin
        if  validateGetView(cds_progress) then
          ViewProgress;
      End;
  end;
end;

procedure TSeaInteration.initVariable;
begin
  pc_main.ActivePageIndex := 0;
  inherited;
  Iteration := TControllerIteration.Create(Self);
end;

procedure TSeaInteration.ProgressClick(Sender: TObject);
begin
  if validateSetProgress then
  Begin
    SetProgress;
  End;
end;

procedure TSeaInteration.setProgress;
var
  form : TCadinterationProgress;
begin
  form := TCadinterationProgress.create(UniApplication);
  ChamadaIntereacao(0,Form.Interation,cds_task);
  Form.kinditeration := '4';
  Form.CodigoRegistro := 0;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form := nil;
    end
  );
end;

procedure TSeaInteration.setProposal;
var
  form : TCadinterationProposal;
begin
  form := TCadinterationProposal.create(UniApplication);
  ChamadaIntereacao(0,Form.Interation,cds_call);
  Form.kinditeration := '2';
  Form.CodigoRegistro := 0;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form := nil;
    end
  );
end;

procedure TSeaInteration.setTask(cds:TClientDataSet);
var
  form : TCadinterationTask;
begin
  form := TCadinterationTask.create(UniApplication);
  //Aqui passando cds e não cds_task por que precisamos da origem
  ChamadaIntereacao(0,Form.Interation,cds);
  Form.kinditeration := '3';
  Form.CodigoRegistro := 0;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form := nil;
    end
  );
end;

procedure TSeaInteration.setComent(cds:TClientDataSet);
var
  form : TCadInteration;
begin
  form := TCadInteration.create(UniApplication);
  ChamadaIntereacao(0,Form.Interation,cds);
  Form.kinditeration := '1';
  Form.CodigoRegistro := 0;//cds_search.FieldByName('id').AsInteger;não preencher pois sempre será um novo comentario
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form := nil;
    end
  );
end;

procedure TSeaInteration.Sb_Inter_CommentClick(Sender: TObject);
begin
  DefineComment;
end;

procedure TSeaInteration.Sb_Inter_proposalClick(Sender: TObject);
begin
  if validateSetProposal then
  Begin
    SetProposal;
  End;
end;

procedure TSeaInteration.Sb_Inter_taskClick(Sender: TObject);
begin
  if validateSetTask then
  Begin
    case pc_main.ActivePageIndex of
      0:setTask(cds_call);
      1:setTask(cds_proposal);
    end;
  End;
end;

procedure TSeaInteration.Sb_Inter_UpdateClick(Sender: TObject);
begin
  search;
end;

procedure TSeaInteration.Sb_Inter_ViewClick(Sender: TObject);
begin
  GetView;
end;

procedure TSeaInteration.search;
Var
  Lc_par:TIntInteration;
begin
  Try
    Lc_par := TIntInteration.Create;
    Lc_par.Estabelecimento  := UMM.GInstitution.Registro.Codigo;
    Lc_par.Ordem            := OrderID;
    case pc_main.ActivePageIndex of
     0: searchCall(Lc_par);
     1: searchProposal(Lc_par);
     2: searchTask(Lc_par);
     3: searchProgress(Lc_par);
    end;
  Finally
    Lc_par.DisposeOf;
  End;
end;

procedure TSeaInteration.searchCall(par:TIntInteration);
begin
  par.Tipo := 1;
  Iteration.IntgetList(par);
  FillDataSet(cds_call);
end;

procedure TSeaInteration.searchProgress(par:TIntInteration);
begin
  par.Tipo := 4;
  Iteration.IntgetList(par);
  FillDataSet(cds_progress);
end;

procedure TSeaInteration.searchProposal(par:TIntInteration);
begin
  par.Tipo := 2;
  Iteration.IntgetList(par);
  FillDataSet(cds_proposal);
end;

procedure TSeaInteration.searchTask(par:TIntInteration);
begin
  par.Tipo := 3;
  Iteration.IntgetList(par);
  FillDataSet(cds_task);
end;

procedure TSeaInteration.DefineComment;
begin
  case pc_main.ActivePageIndex of
   0: BEgin
        if  validateSetComent(cds_call) then
          setComent(cds_call);
      End;
   1: BEgin
        if  validateSetComent(cds_proposal) then
          setComent(cds_proposal);
      End;
   2: Begin
        if  validateSetComent(cds_task) then
          setComent(cds_task);
      End;
   3: BEgin
        if  validateSetComent(cds_progress) then
          setComent(cds_progress);
      End;
  end;
end;

procedure TSeaInteration.fillDataSet(cds: TClientDataSet);
Var
  I : Integer;
begin
  with cds,Iteration do
  Begin
    if not Active then CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to ListaInterface.Count-1 do
    Begin
      Append;
      FieldByName('tb_institution_id').AsInteger  := ListaInterface[I].Estabelecimento;
      FieldByName('id').AsInteger                 := ListaInterface[I].id;
      FieldByName('tb_order_id').AsInteger        := ListaInterface[I].Ordem;
      FieldByName('updated_at').AsDateTime        := ListaInterface[I].Atualizacao;
      FieldByName('comentario').AsString          := ListaInterface[I].commentatio;
      FieldByName('situacao').AsString            := ListaInterface[I].situacao;
      FieldByName('kind').AsString                := ListaInterface[I].situacao;
      FieldByName('tb_customer_id').AsInteger     := ListaInterface[I].Cliente;
      post;
    End;
    LogChanges := True;
  End;
end;

procedure TSeaInteration.setImages;
begin
  inherited;

end;


function TSeaInteration.validateSetComent(cds: TClientDataSet): Boolean;
begin
  Result := True;
  if not validateDataSetOpen(cds) then
  Begin
    Result := False;
    exit;
  End;

  if not validateExistRegister(cds) then
  Begin
    Result := False;
    exit;
  End;
end;

function TSeaInteration.validateDataSetOpen(cds: TClientDataSet): Boolean;
begin
  Result := True;
  if not cds.Active then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Nenhuma busca foi efetuada.',
                  'Clique em buscar e tente novamente']);
    Result := False;
    exit;
  end;
end;

function TSeaInteration.validateExistRegister(cds: TClientDataSet): Boolean;
begin
  if cds.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros disponível.',
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  end;
end;

function TSeaInteration.validateGetView(cds:TClientDataSet): Boolean;
begin
  Result := True;
  if not validateDataSetOpen(cds) then
  Begin
    Result := False;
    exit;
  End;

  if not validateExistRegister(cds) then
  Begin
    Result := False;
    exit;
  End;

end;

function TSeaInteration.validateSetProgress: Boolean;
begin
  Result := True;
  case pc_main.ActivePageIndex of
    2:BEgin
        if not validateDataSetOpen(cds_call) then
        Begin
          Result := False;
          exit;
        End;

        if not validateExistRegister(cds_call) then
        Begin
          Result := False;
          exit;
        End;
    End;
    else
    BEgin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    '     É permitido criar Progresso ',
                    'somente a paritr de uma Tarefaroposta.',
                    'Escolha corretamente e tente novamente']);
      Result := False;
      exit;
    End;
  end;

end;

function TSeaInteration.validateSetProposal: Boolean;
begin
  Result := True;
  if not validateDataSetOpen(cds_call) then
  Begin
    Result := False;
    exit;
  End;

  if not validateExistRegister(cds_call) then
  Begin
    Result := False;
    exit;
  End;

end;

function TSeaInteration.validateSetTask: Boolean;
begin
  Result := True;
  case pc_main.ActivePageIndex of
    0:BEgin
        if not validateDataSetOpen(cds_call) then
        Begin
          Result := False;
          exit;
        End;

        if not validateExistRegister(cds_call) then
        Begin
          Result := False;
          exit;
        End;
    End;
    1:BEgin
        if not validateDataSetOpen(cds_proposal) then
        Begin
          Result := False;
          exit;
        End;

        if not validateExistRegister(cds_proposal) then
        Begin
          Result := False;
          exit;
        End;
    End;
    else
    BEgin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'É permitido criar Tarefa somente a paritr de ',
                    'um chamado ou uma proposta.',
                    'Escolha corretamente e tente novamente']);
      Result := False;
      exit;
    End;
  end;
end;

procedure TSeaInteration.ViewComent;
var
  form : TCadInteration;
begin
  form := TCadInteration.create(UniApplication);
  ChamadaIntereacao(cds_call.FieldByName('id').AsInteger,Form.Interation,cds_call);
  Form.kinditeration := '1';
  Form.CodigoRegistro := cds_call.FieldByName('id').AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form := nil;
    end
  );
end;

procedure TSeaInteration.ViewProgress;
var
  form : TCadinterationProgress;
begin
  form := TCadinterationProgress.create(UniApplication);
  ChamadaIntereacao(cds_progress.FieldByName('id').AsInteger,Form.Interation,cds_progress);
  Form.kinditeration := '4';
  Form.CodigoRegistro := cds_progress.FieldByName('id').AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form := nil;
    end
  );


end;

procedure TSeaInteration.ViewProposal;
var
  form : TCadinterationProposal;
begin
  form := TCadinterationProposal.create(UniApplication);
  ChamadaIntereacao(cds_proposal.FieldByName('id').AsInteger,Form.Interation,cds_proposal);
  Form.kinditeration := '3';
  Form.CodigoRegistro := cds_proposal.FieldByName('id').AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form := nil;
    end
  );
end;

procedure TSeaInteration.ViewTask;
var
  form : TCadinterationTask;
begin
  form := TCadinterationTask.create(UniApplication);
  ChamadaIntereacao(cds_task.FieldByName('id').AsInteger,Form.Interation,cds_task);
  Form.kinditeration := '2';
  Form.CodigoRegistro := cds_task.FieldByName('id').AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form := nil;
    end
  );


end;

end.
