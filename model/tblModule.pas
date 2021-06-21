unit tblModule;


interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_module')]
  TModule = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    Ftechnical_name: String;

    Facao_index: Integer;
    Fimg_index: Integer;
    Facao_botao: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFtechnical_name(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFacao_index(const Value: Integer);
    procedure setFacao_botao(const Value: String);
    procedure setFimg_index(const Value: Integer);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('technical_name')]
    property NomeTecnico: String read Ftechnical_name write setFtechnical_name;

    [FieldName('img_index')]
    property ImagemIndex: Integer read Fimg_index write setFimg_index;

    [FieldName('acao_botao')]
    property AcaoBotao: String read Facao_botao write setFacao_botao;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TModule }

procedure TModule.setFacao_botao(const Value: String);
begin
  Facao_botao := Value;
end;

procedure TModule.setFacao_index(const Value: Integer);
begin
  Facao_index := Value;
end;

procedure TModule.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TModule.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TModule.setFId(const Value: Integer);
begin
  FId := Value;
end;


procedure TModule.setFimg_index(const Value: Integer);
begin
  Fimg_index := Value;
end;

procedure TModule.setFtechnical_name(const Value: String);
begin
  Ftechnical_name := Value;
end;

procedure TModule.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
