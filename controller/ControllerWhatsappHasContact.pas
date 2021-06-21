unit ControllerWhatsappHasContact;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblWhatsappHasContact, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerWhatsappHasContact = Class(TBaseController)
  private

  public
    Registro : TWhatsappHasContact;
    Lista : TListWhatsAppContact;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure clear;
    function save:boolean;
    function update:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    procedure getlist;
    procedure acessado;
  End;
implementation

{ TControllerWhatsappHasContact }

procedure TControllerWhatsappHasContact.acessado;
var
  Lc_Qry : TFDQuery;
  lcItem : TWhatsappHasContact;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
              'UPDATE tb_whatsapp_has_contact SET' +
              ' active =:active ',
              'where ( tb_institution_id =:tb_institution_id ) ',
              ' and  ( tb_whatsapp_id =:tb_whatsapp_id ) ',
              ' and  ( id =:id ) '
      ));

      //Incrementa SQL

      //Passagem de parametros
      parambyname('tb_institution_id').AsInteger := Registro.Estabelecimento;
      parambyname('tb_whatsapp_id').AsString  := Registro.ContaOrigem;
      parambyname('id').AsString              := Registro.ContaDestino;
      parambyname('active').AsString          := Registro.Ativo;
      ExecSQL;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

procedure TControllerWhatsappHasContact.clear;
begin
  clearObj(Registro);
end;

constructor TControllerWhatsappHasContact.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TWhatsappHasContact.Create;
  Lista := TListWhatsAppContact.Create;
end;

function TControllerWhatsappHasContact.delete: boolean;
begin
 try
    deleteObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

destructor TControllerWhatsappHasContact.Destroy;
begin
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerWhatsappHasContact.getAllByKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerWhatsappHasContact.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerWhatsappHasContact.getlist;
var
  Lc_Qry : TFDQuery;
  lcItem : TWhatsappHasContact;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_whatsapp_has_contact ',
                     'WHERE ( tb_institution_id =:institution_id ) ',
                     ' and tb_whatsapp_id =:tb_whatsapp_id ',
                     ' and (updated_at >:updated_at ) ',
                     ' order by updated_at desc '
      ));

      //Incrementa SQL

      //Passagem de parametros
      parambyname('updated_at').AsDateTime := Registro.RegistroAlterado;
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;
      parambyname('tb_whatsapp_id').AsString := Registro.ContaOrigem;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcITem := TWhatsappHasContact.Create;
        get(Lc_Qry,LcITem);
        Lista.add(LcITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerWhatsappHasContact.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

function TControllerWhatsappHasContact.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

function TControllerWhatsappHasContact.update: boolean;
begin
  try
    updateObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

end.
