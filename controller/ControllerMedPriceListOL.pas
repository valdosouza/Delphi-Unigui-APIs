unit ControllerMedPriceListOL;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMedPriceListOL, Md5, FireDAC.Stan.Param,
      ControllerEntity, ControllerBank, System.Generics.Collections,
      Datasnap.DBClient, Data.DB, FireDAC.Comp.Client,  IntMedFormats;

Type
  TListaMedPriceListOL = TObjectList<TMedPriceListOL>;
  TListaIntMedFormats = TObjectList<TIntMedFormats>;

  TControllerMedPriceListOL = Class(TBaseController)
  Lista: TListaMedPriceListOL;
    procedure clear;
  private


  public
    Registro : TMedPriceListOL;
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
    procedure getListIntFormatsByCity(Cities:String);
    function getLinkImageFormat(InstitutionID:Integer;Formats:String):String;
    procedure getListByFoormatCity(Format: String; CityID:Integer);
  End;

implementation

{ ControllerMedPriceListJR }

procedure TControllerMedPriceListOL.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerMedPriceListOL.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMedPriceListOL.Create;
  Lista       := TListaMedPriceListOL.Create;
  ListaIntMedFormats := TListaIntMedFormats.create;
end;

function TControllerMedPriceListOL.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerMedPriceListOL.Destroy;
begin
  ListaIntMedFormats.disposeOf;
  Registro.disposeOf;
  inherited;
end;


function TControllerMedPriceListOL.insert: boolean;
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

function TControllerMedPriceListOL.save: boolean;
begin

  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerMedPriceListOL.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerMedPriceListOL.getAllByKey: boolean;
begin
   getByKey;
End;

function TControllerMedPriceListOL.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerMedPriceListOL.getLinkImageFormat(InstitutionID: Integer;
  Formats: String): String;
var
  Lc_Qry : TFDQuery;
  Lc_Item : TIntMedFormats;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'select distinct  pol.path_file ',
                'from tb_med_price_list_ol pol ',
                'where( pol.formats =:formats ) ',
//                ' and ( pjr.path_file <> '''' ),',
                ' and ( pol.path_file is not null ) ',
                ' and ( pol.tb_institution_id =:tb_institution_id) '
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

procedure TControllerMedPriceListOL.getList;
var
  Qry : TFDQuery;
  LITem : TMedPriceListOL;
begin
  Try
    Qry := createQuery;
    with Qry do
    Begin
      sql.add(concat( ' SELECT OL.* ',
                      ' FROM tb_med_price_list_ol OL ',
                      ' where OL.tb_institution_id = :institution_id ',
                      ' AND OL.tb_broadcaster_id =:broadcaster_id'
                      ));
       ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
       ParamByName('broadcaster_id').AsInteger := Registro.Veiculo;
      Active := True;
      FetchAll;
      First;
     // Lista.Clear;
      while not eof do
     Begin
        LITem := TMedPriceListOL.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Qry);
  End;


end;

procedure TControllerMedPriceListOL.getListByFoormatCity(Format: String;
  CityID: Integer);
var
  Lc_Qry : TFDQuery;
  Lc_Item : TMedPriceListOL;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'select pol.* ',
                'from tb_med_price_list_ol pol ',
                '    inner join tb_broadcaster b ',
                '    on (pol.tb_broadcaster_id = b.id) ',
                '    and (pol.tb_institution_id = b.tb_institution_id) ',
                '    inner join tb_address adr ',
                '    on (adr.id = b.id) ',
                '    inner join tb_city c ',
                '    on (c.id =adr.tb_city_id) ',
                'where pol.online_price >0 ',
                ' and adr.tb_city_id = :tb_city_id ',
                ' and pol.formats = :formats ',
                ' and pol.tb_institution_id =:tb_institution_id ',
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
        Lc_Item := TMedPriceListOL.Create;
        get(Lc_Qry,Lc_Item);
        Lista.add(Lc_Item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

procedure TControllerMedPriceListOL.getListIntFormatsByCity(Cities: String);
var
  Lc_Qry : TFDQuery;
  Lc_Item : TIntMedFormats;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'select distinct oln.formats ',
                'from tb_med_price_list_ol oln ',
                '    inner join tb_broadcaster b ',
                '      on (oln.tb_broadcaster_id = b.id) ',
                '      and (oln.tb_institution_id = b.tb_institution_id) ',
                '    inner join tb_address adr ',
                '    on (adr.id = b.id) ',
                '    inner join tb_city c ',
                '    on (c.id =adr.tb_city_id) ',
                'where oln.online_price >0 ',
                ' and adr.tb_city_id in (', cities, ') ',
                ' and oln.tb_institution_id =:tb_institution_id ',
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
        Lc_Item.LinkImagem  := getLinkImageFormat(registro.Estabelecimento,FieldByName('formats').AsString);

        ListaIntMedFormats.add(Lc_Item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

end.
