unit ControllerMedPriceListJR;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMedPriceListJR, Md5, FireDAC.Stan.Param,
      ControllerEntity, ControllerBank, System.Generics.Collections,
      Datasnap.DBClient, Data.DB, FireDAC.Comp.Client,
        objMedPriceListJr,ControllerMedPosProg,intMedFormats;

Type
  TListaMedPriceListJR = TObjectList<TMedPriceListJR>;
  TListaIntMedFormats = TObjectList<TIntMedFormats>;

  TControllerMedPriceListJR = Class(TBaseController)
  Lista: TListaMedPriceListJR;
    procedure clear;
  private

  public
    Registro : TMedPriceListJr;
    Posicao : TControllerMedPosProg;
    ListaIntMedFormats: TListaIntMedFormats;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getList;

    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;
    function getByKey:Boolean;
    function getAllByKey:Boolean;
    function getByPosition:Boolean;
    function saveDataObjeto(DObj : TobjMedPriceListJr):Boolean;
    procedure getListIntFormatsByCity(Cities:String);
    function getLinkImageFormat(InstitutionID:Integer;Formats:String):String;
    procedure getListByFoormatCity(Format: String; CityID:Integer);
  End;

implementation

{ ControllerMedPriceListJR }

uses ControllerEntityFiscal;

procedure TControllerMedPriceListJR.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMedPriceListJR.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TMedPriceListJR.Create;
  Lista       := TListaMedPriceListJR.Create;
  Posicao     := TControllerMedPosProg.Create(Self);
  ListaIntMedFormats := TListaIntMedFormats.create;
end;

function TControllerMedPriceListJR.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerMedPriceListJR.Destroy;
begin
  ListaIntMedFormats.DisposeOf;
  Registro.DisposeOf;
  Lista.DisposeOf;
  Posicao.DisposeOf;
  inherited;
end;


function TControllerMedPriceListJR.insert: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMedPriceListJR.save: boolean;
begin

  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerMedPriceListJR.saveDataObjeto(
  DObj: TobjMedPriceListJr): Boolean;
Var
  LcIdEntity : Integer;
  LcId : Integer;
  Lc_Fiscal : TControllerEntityFiscal;
begin
  Try
    Lc_Fiscal := TControllerEntityFiscal.Create(nil);
    Registro := DObj.Tabela;
    LcIdEntity := 0;
    LcIdEntity := Lc_Fiscal.Juridica.getIDbyCNPJ(DObj.VeiculoCNPJ);
    if LcIdEntity = 0 then
      LcIdEntity := Lc_Fiscal.Fisica.getIDbyCPF(DObj.VeiculoCNPJ);
    Registro.Veiculo := LcIdEntity;
    save;
  Finally
    Lc_Fiscal.DisposeOf;
  End;
end;

function TControllerMedPriceListJR.update: boolean;
begin
  try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMedPriceListJR.getAllByKey: boolean;
begin
   getByKey;
End;

function TControllerMedPriceListJR.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerMedPriceListJR.getByPosition: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.add(concat( ' SELECT * ',
                      ' FROM tb_med_price_list_jr jr ',
                      ' where jr.tb_institution_id =:institution_id ',
                      ' AND jr.tb_broadcaster_id =:broadcaster_id ',
                      ' and jr.id =:tb_med_price_id '
                      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('broadcaster_id').AsInteger := Registro.Veiculo;
      ParamByName('tb_med_price_id').AsInteger := Registro.Codigo;
      Active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

function TControllerMedPriceListJR.getLinkImageFormat(InstitutionID:Integer;Formats:String): String;
var
  Lc_Qry : TFDQuery;
  Lc_Item : TIntMedFormats;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'select distinct  pjr.path_file ',
                'from tb_med_price_list_jr pjr ',
                'where( pjr.formats =:formats ) ',
//                ' and ( pjr.path_file <> '''' ),',
                ' and ( pjr.path_file is not null ) ',
                ' and ( pjr.tb_institution_id =:tb_institution_id) '
      ));
      ParamByName('formats').AsString := Formats;
      ParamByName('tb_institution_id').AsInteger := InstitutionID;
      Active := True;
      FetchAll;
      Result := FieldByName('path_file').AsString;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerMedPriceListJR.getList;
var
  Qry : TFDQuery;
  LITem : TMedPriceListJR;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat( ' SELECT jr.* ',
                    ' FROM tb_med_price_list_jr jr ',
                    ' where jr.tb_institution_id = :institution_id ',
                    ' AND jr.tb_broadcaster_id =:broadcaster_id'
                    ));
     ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
     ParamByName('broadcaster_id').AsInteger := Registro.Veiculo;
    Active := True;
    FetchAll;
    First;
   // Lista.Clear;
    while not eof do
   Begin
      LITem := TMedPriceListJR.Create;
      get(Qry,LITem);
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);

end;

procedure TControllerMedPriceListJR.getListByFoormatCity(Format: String; CityID:Integer);
var
  Lc_Qry : TFDQuery;
  Lc_Item : TMedPriceListJR;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'select pjr.* ',
                'from tb_med_price_list_jr pjr ',
                '    inner join tb_broadcaster b ',
                '    on (pjr.tb_broadcaster_id = b.id) ',
                '      and (pjr.tb_institution_id = b.tb_institution_id ) ',
                '    inner join tb_address adr ',
                '    on (adr.id = b.id) ',
                '    inner join tb_city c ',
                '    on (c.id =adr.tb_city_id) ',
                'where pjr.online_price >0 ',
                ' and adr.tb_city_id = :tb_city_id ',
                ' and pjr.formats = :formats ',
                ' and pjr.tb_institution_id =:tb_institution_id ',
                'ORDER BY 1 asc '
      ));
      ParamByName('tb_city_id').AsInteger         := CityID;
      ParamByName('formats').AsString             := Format;
      ParamByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        Lc_Item := TMedPriceListJR.Create;
        get(Lc_Qry,Lc_Item);
        Lista.add(Lc_Item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

procedure TControllerMedPriceListJR.getListIntFormatsByCity(Cities:String);
var
  Lc_Qry : TFDQuery;
  Lc_Item : TIntMedFormats;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'select distinct pjr.formats ',
                'from tb_med_price_list_jr pjr ',
                '    inner join tb_broadcaster b ',
                '    on (pjr.tb_broadcaster_id = b.id) ',
                '      and (pjr.tb_institution_id = b.tb_institution_id) ',
                '    inner join tb_address adr ',
                '    on (adr.id = b.id) ',
                '    inner join tb_city c ',
                '    on (c.id =adr.tb_city_id) ',
                'where pjr.online_price >0 ',
                ' and adr.tb_city_id in (', cities, ') ',
                ' and pjr.tb_institution_id =:tb_institution_id ',
                'ORDER BY 1 asc '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      ListaIntMedFormats.Clear;
      while not eof do
      Begin
        Lc_Item := TIntMedFormats.Create;
        Lc_Item.Codigo     := 0;
        Lc_Item.Descricao  := FieldByName('formats').AsString;
        Lc_Item.Selecao    := 'N';
        Lc_Item.LinkImagem := getLinkImageFormat(registro.Estabelecimento,FieldByName('formats').AsString);
        ListaIntMedFormats.add(Lc_Item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

end.
