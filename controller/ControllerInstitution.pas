unit ControllerInstitution;

interface

uses
  System.Classes, System.SysUtils,BaseController,
  FireDAC.Comp.Client,Md5, FireDAC.Stan.Param, Rest.json,
  prm_institution,
  TypesCollection,
  ObjInstitution,
  tblInstitution,
  ControllerAddress,
  ControllerCompany,
  ControllerPerson,
  ControllerInstitutionHasModule,
  ControllerModule,
  ControllerEntityFiscal,
  ClasseUtil,
  UnitConstantes,
  prm_base,
  ControllerUser, ControllerInstitutionHasEntity, UnFunctions;

Type
  TControllerInstitution = Class(TBaseController)

    procedure clear;
  private
    FPathPrivado: String;
    FPathPublico: String;
    FURL: String;
    FEstoque: Integer;
    FPathImage: String;
    procedure setFEstoque(const Value: Integer);
  public
    Registro : TInstitution;
    Fiscal : TControllerEntityFiscal;
    InstitutionHasModule : TControllerInstitutionHasModule;
    InstitutionHasEntity : TControllerInstitutionHasEntity;
    Module : TControllerModule;
    User : TControllerUser;
    Lista : TListInstitution;
    Parametro : TPrmInstitution;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;

    function getByKey:Boolean;
    function getAllByKey:boolean;

    procedure getlist;
    procedure getlistByUser;
    procedure fillDataObjeto(pInstitution:TInstitution;pObj:TObjInstitution);

    procedure getRepository(bycnpj:Boolean;Directory:String);
    property PathImage : String read FPathImage;
    property PathPublico : String read FPathPublico;
    property PathPrivado : String read FPathPrivado;
    property URL : String read FURL;
//    property Usuario : Integer read FUsuario write setFUsuario;
    property Estoque : Integer Read FEstoque write setFEstoque;
  End;

implementation

{ ControllerInstitution }

procedure TControllerInstitution.clear;
begin
  clearObj(Registro);
end;

constructor TControllerInstitution.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInstitution.Create;
  Fiscal := TControllerEntityFiscal.Create(Self);
  InstitutionHasModule := TControllerInstitutionHasModule.Create(self);
  InstitutionHasEntity := TControllerInstitutionHasEntity.Create(self);
  Module := TControllerModule.Create(self);
  User := TControllerUser.Create(self);
  Lista := TListInstitution.create;
  Parametro := TPrmInstitution.Create;

end;

function TControllerInstitution.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerInstitution.Destroy;
begin
  Parametro.Destroy;
  InstitutionHasEntity.DisposeOf;
  InstitutionHasModule.DisposeOf;
  Fiscal.Destroy;
  Registro.DisposeOf;
  module.DisposeOf;
  User.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;

procedure TControllerInstitution.fillDataObjeto(pInstitution: TInstitution;
  pObj: TObjInstitution);
begin
  pObj.Estabelecimento  := pInstitution.Codigo;
  _assign(pInstitution,pObj.Institution);
  Self.Fiscal.fillDataObjeto(pInstitution.Codigo,pObj.Fiscal);
end;

function TControllerInstitution.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerInstitution.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;



procedure TControllerInstitution.setFEstoque(const Value: Integer);
begin
  FEstoque := Value;
end;

procedure TControllerInstitution.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmInstitution>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
end;

function TControllerInstitution.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;
end;

function TControllerInstitution.getByKey: Boolean;
begin
  _getByKey(Registro);
end;


procedure TControllerInstitution.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TInstitution;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'SELECT i.* ',
                'FROM tb_institution i '
      ));
      //Incrementa SQL - Inner
      if Parametro.Usuario > 0 then
      Begin
        sql.add(concat(
                  'inner join tb_institution_has_user ihu ',
                  'on (ihu.tb_institution_id = i.id) '
        ));
      End;
      //Incrementa SQL - Where
      if Parametro.Usuario > 0 then
      Begin
        sql.add(concat(
                  'where ( ihu.tb_user_id =:tb_user_id ) '
        ));
      End;

      if ( Parametro.Limite <> '0' ) and ( Parametro.Limite <> '') then
        sql.add(concat(' limit 0, ',Parametro.Limite));

      //Passagem de parametros
      if Parametro.Usuario > 0 then
        ParamByName('tb_user_id').AsInteger := Parametro.Usuario;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TInstitution.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;


end;

procedure TControllerInstitution.getlistByUser;
var
  Lc_Qry : TFDQuery;
  LITem : TInstitution;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'SELECT i.* ',
                'FROM tb_institution i ',
                'inner join tb_institution_has_user ihu ',
                'on (ihu.tb_institution_id = i.id) ',
                'where ( ihu.tb_user_id =:tb_user_id ) and ( ihu.tb_user_id > 0 ) '
        ));
      ParamByName('tb_user_id').AsInteger := Parametro.Usuario;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TInstitution.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

procedure TControllerInstitution.getRepository(bycnpj:Boolean;Directory:String);
Var
  path,
  Cnpj,
  Online : String;
begin
  Fiscal.Juridica.Registro.Codigo := Registro.Codigo;
  Cnpj := Fiscal.Juridica.getCnpjById;
  //Publico
  FPathPublico := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Publico');
  if FPathPublico = '' then
    FPathPublico := 'C:\Domains\gestaosetes.com.br\gestaowebsetes.com.br\public_html\';
  if bycnpj then
    FPathPublico := concat(FPathPublico,'institution\',Cnpj,'\')
  else
    FPathPublico := concat(FPathPublico,'institution\',Cnpj,'\',User.Registro.codigo.ToString,'\');
  //Publico - Verifica se tem diretorio
  if trim(Directory )<> ''then
    FPathPublico := concat(FPathPublico,Directory,'\');

  //PathImage
  FPathImage := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','FPathImage');
  if FPathImage = '' then
  Begin
    FPathImage := 'C:\Domains\gestaosetes.com.br\gestaowebsetes.com.br\public_html\';
    FPathImage := concat(FPathImage,'institution\',Cnpj,'\');
  End;

  //Privado
  FPathPrivado := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Privado');
  if FPathPrivado = '' then
    FPathPrivado := 'C:\gestaoweb\';
  FPathPrivado := concat(FPathPrivado,'institution\',Cnpj,'\');
  //Privado - Verifica se tem diretorio
  if trim(Directory )<> ''then
    FPathPrivado := concat(FPathPrivado,Directory,'\');


  //URL
  FURL := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','URL');
  if FURL = '' then
    FURL := 'http://www.gestaowebsetes.com.br/';
  if bycnpj then
    FURL := concat(FURL,'institution/',Cnpj,'/')
  else
    FURL := concat(FURL,'institution/',Cnpj,'/',User.Registro.codigo.ToString,'/');
  //URL - Verifica se tem diretorio
  if trim(Directory )<> ''then
    FURL := concat(FURL,Directory,'/');


  if not (DirectoryExists(FPathPublico)) then ForceDirectories(FPathPublico);
  if not (DirectoryExists(FPathPrivado)) then ForceDirectories(FPathPrivado);
end;

end.


