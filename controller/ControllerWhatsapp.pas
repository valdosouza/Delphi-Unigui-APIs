unit ControllerWhatsapp;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblWhatsapp, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
  ControllerWhatsappHasContact,ControllerWhatsappHasTalk, whatsAppWeb;

Type
  TControllerWhatsapp = Class(TBaseController)
  private

  public
    Registro : TWhatsapp;
    HasContact : TControllerWhatsappHasContact;
    HasTalk : TControllerWhatsappHasTalk;
    WhatsappWeb: TWhatsAppWeb;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure clear;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getFirstByKey:Boolean;
    function getAllByKey:boolean;
    procedure getlist;

  End;
implementation

{ TControllerWhatsapp }

procedure TControllerWhatsapp.clear;
begin
  clearObj(Registro);
end;

constructor TControllerWhatsapp.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TWhatsapp.Create;
  HasContact := TControllerWhatsappHasContact.Create(Self);
  HasTalk := TControllerWhatsappHasTalk.Create(Self);
  WhatsappWeb  := TWhatsAppWeb.Create(Self);
end;

function TControllerWhatsapp.delete: boolean;
begin
 try
    deleteObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

destructor TControllerWhatsapp.Destroy;
begin
  WhatsappWeb.DisposeOf;
  Registro.DisposeOf;
  HasContact.DisposeOf;
  HasTalk.DisposeOf;
  inherited;
end;

function TControllerWhatsapp.getAllByKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerWhatsapp.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerWhatsapp.getFirstByKey: Boolean;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_whatsapp ',
                     'WHERE ( tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;

      Active := True;
      FetchAll;
      exist  := ( Lc_Qry.RecordCount > 0 );
      if exist then get(Lc_Qry,Registro);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerWhatsapp.getlist;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_clin_questionnaire ',
                     'WHERE ( tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;

      Active := True;
      FetchAll;
      First;
      //Lista.Clear;
      while not eof do
      Begin
        //LITem := TClinQuestionnaire.Create;
        //get(Lc_Qry,LITem);
        //Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerWhatsapp.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

function TControllerWhatsapp.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

end.
