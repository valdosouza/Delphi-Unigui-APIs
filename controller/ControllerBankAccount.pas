unit ControllerBankAccount;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBankAccount, FireDAC.Comp.Client,FireDAC.Stan.Param,
  objBankAccount, ControllerBank;

Type
   TControllerBankAccount = Class(TBaseController)
    procedure clear;
  private
  public
    Registro : TBankAccount;
    Obj: TObjBankAccount;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getIdByAccount(pBank:Integer;pAgency,pNúmber:String): Integer;
    function saveDataObjeto(DObj : TObjBankAccount):Boolean;
  End;

implementation


procedure TControllerBankAccount.clear;
begin
  clearObj(Registro);
end;

constructor TControllerBankAccount.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TBankAccount.Create;
  Obj       := TObjBankAccount.create;
end;

function TControllerBankAccount.delete: boolean;
begin
end;

destructor TControllerBankAccount.Destroy;
begin
  Registro.DisposeOf;
  Obj.Destroy;
  inherited;
end;


function TControllerBankAccount.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBankAccount.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerBankAccount.saveDataObjeto(DObj: TObjBankAccount): Boolean;
Var
  LcId : Integer;
  LcBank : TControllerBank;
  LcBankId : Integer;
begin
  Try
    Try
      LcBank := TControllerBank.create(nil);

      with DObj do
      Begin
        LcBankId := LcBank.getIdByNumber(NumeroBanco);
        LcId := getIdByAccount(LcBankId,ContaCorrente.Agencia,ContaCorrente.Numero);
        if LcId = 0 then
        Begin

          LcBank.Institution.Estabelecimento := ContaCorrente.Estabelecimento;
          LcBank.Institution.Banco := LcBankId;
          LcBank.SaveInstitution;

          ClonarObj(ContaCorrente, Registro);
          Registro.Codigo := 0;
          Registro.Banco := LcBankId;
          insert;
        End
        else
        Begin
          Registro := ContaCorrente;
          Registro.Codigo := LcId;
          Registro.Banco := LcBankId;
          update;
        End;
      End;
      Result := true;
    except
      Result := False;
    end;
  Finally
    LcBank.DisposeOf;
  End;
end;

function TControllerBankAccount.update: boolean;
begin
  try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;



function TControllerBankAccount.getIdByAccount(pBank:Integer;pAgency,pNúmber:String): Integer;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'SELECT * FROM tb_bank_account ',
                'where ( tb_bank_id = :tb_bank_id ) ',
                ' and ( agency =:agency ) ',
                ' and ( number =:number  ) '
                ));
      ParamByName('tb_bank_id').AsInteger := pBank;
      ParamByName('agency').AsString :=pAgency;
      ParamByName('number').AsString :=pNúmber;
      Active := True;
      FetchAll;
      Result := RecordCount;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerBankAccount.getByKey: Boolean;
begin
  _getByKey(Registro);
end;


end.
