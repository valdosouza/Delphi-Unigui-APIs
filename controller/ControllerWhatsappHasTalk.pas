unit ControllerWhatsappHasTalk;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblWhatsappHasTalk, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerWhatsappHasTalk = Class(TBaseController)
  private

  public
    Registro : TWhatsappHasTalk;
    Lista : TListWhatsAppTalk;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure clear;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    procedure getlist;

  End;
implementation

{ TControllerWhatsappHasTalk }

procedure TControllerWhatsappHasTalk.clear;
begin
  clearObj(Registro);
end;

constructor TControllerWhatsappHasTalk.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TWhatsappHasTalk.Create;
  Lista := TListWhatsAppTalk.Create;
end;

function TControllerWhatsappHasTalk.delete: boolean;
begin
 try
    deleteObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

destructor TControllerWhatsappHasTalk.Destroy;
begin
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerWhatsappHasTalk.getAllByKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerWhatsappHasTalk.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerWhatsappHasTalk.getlist;
var
  Lc_Qry : TFDQuery;
  lcItem : TWhatsappHasTalk;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT id, tb_institution_id,tb_whatsapp_id,contact_id, ',
                     'cONVERT(body_text USING utf8) body_text  ,type_way,active,created_at,updated_at ',
                     'FROM tb_whatsapp_has_talk ',
                     'WHERE ( tb_institution_id =:institution_id ) ',
                     ' and tb_whatsapp_id =:tb_whatsapp_id ',
                     ' and contact_id =:contact_id ',
                     ' and (id >:id ) '
      ));

      //Incrementa SQL

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;
      parambyname('tb_whatsapp_id').AsString  := Registro.ContaOrigem;
      parambyname('contact_id').AsString      := Registro.ContaDestino;
      parambyname('id').AsInteger             := Registro.Codigo;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcITem := TWhatsappHasTalk.Create;
        get(Lc_Qry,LcITem);
        Lista.add(LcITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerWhatsappHasTalk.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

function TControllerWhatsappHasTalk.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

end.
