unit tblInterface;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_interface')]
  Tinterface = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    Fkind: String;
    Fposition: String;
    Fimg_index: Integer;
    Facao_botao: String;

    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFkind(const Value: String);
    procedure setFposition(const Value: String);
    procedure setFimg_index(const Value: Integer);
    procedure setFacao_botao(const Value: String);



  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('position')]
    property Posicao: String read Fposition write setFposition;

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

{ Tinterface }


procedure Tinterface.setFacao_botao(const Value: String);
begin
  Facao_botao := Value;
end;

procedure Tinterface.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure Tinterface.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure Tinterface.setFId(const Value: Integer);
begin
  FId := Value;
end;


procedure Tinterface.setFimg_index(const Value: Integer);
begin
  Fimg_index := Value;
end;

procedure Tinterface.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure Tinterface.setFposition(const Value: String);
begin
  Fposition := Value;
end;

procedure Tinterface.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
