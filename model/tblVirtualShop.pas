unit tblVirtualShop;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_virtual_shop')]
  TVirtualShop = Class(TGenericEntity)

  private
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    Ftitle: String;
    Factive: String;
    Fdomain: String;
    Fvitrine: String;
    Fdealer: String;
    Ftb_price_list_id: Integer;
    Ftb_stockes_id: Integer;
    Ftb_institution_id: Integer;
    Fgoogle_analytics_id: String;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdealer(const Value: String);
    procedure setFdomain(const Value: String);
    procedure setFgoogle_analytics_id(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_price_list_id(const Value: Integer);
    procedure setFtb_stockes_id(const Value: Integer);
    procedure setFtitle(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFvitrine(const Value: String);



  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('title')]
    property Titulo: String read Ftitle write setFtitle;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('domain')]
    property Dominio: String read Fdomain write setFdomain;

    [FieldName('vitrine')]
    property Vitrine: String read Fvitrine write setFvitrine;

    [FieldName('dealer')]
    property Revendedor: String read Fdealer write setFdealer;

    [FieldName('google_analytics_id')]
    property IdenGoogle: String read Fgoogle_analytics_id write setFgoogle_analytics_id;

    [FieldName('tb_price_list_id')]
    property TabelaPreco: Integer read Ftb_price_list_id write setFtb_price_list_id;

    [FieldName('tb_stockes_id')]
    property Estoque: Integer read Ftb_stockes_id write setFtb_stockes_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation



{ TVirtualShop }

procedure TVirtualShop.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TVirtualShop.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TVirtualShop.setFdealer(const Value: String);
begin
  Fdealer := Value;
end;

procedure TVirtualShop.setFdomain(const Value: String);
begin
  Fdomain := Value;
end;

procedure TVirtualShop.setFgoogle_analytics_id(const Value: String);
begin
  Fgoogle_analytics_id := Value;
end;

procedure TVirtualShop.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TVirtualShop.setFtb_price_list_id(const Value: Integer);
begin
  Ftb_price_list_id := Value;
end;

procedure TVirtualShop.setFtb_stockes_id(const Value: Integer);
begin
  Ftb_stockes_id := Value;
end;

procedure TVirtualShop.setFtitle(const Value: String);
begin
  Ftitle := Value;
end;

procedure TVirtualShop.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TVirtualShop.setFvitrine(const Value: String);
begin
  Fvitrine := Value;
end;

end.
