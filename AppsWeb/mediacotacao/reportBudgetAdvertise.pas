unit reportBudgetAdvertise;

interface

uses Vcl.Imaging.jpeg,   Vcl.Imaging.pngimage,  IdCoderMIME, System.Classes,
  System.SysUtils, unimHTMLFrame;
Type
  TReportBudgetAdvertise = Class
  private
    Fpagina: TUnimHTMLFrame;
    function base64_encoding(FileNAme:String):String;
    function Header:String;
    function ScriptCode:String;
    function Style:String;
    function Body:String;
    function Cabecalho:String;
    function Titulo:String;
    function grupoImp:String;
    function LinhaImparImp:String;
    function LinhaParImp:String;
    procedure setFPagina(const Value: TUnimHTMLFrame);
  public
    constructor Create;
    destructor Destroy;
    Function gera:String;
    Property PAgina : TUnimHTMLFrame read Fpagina write setFPagina;
  End;
implementation

{ TReportBudgetAdvertise }


function TReportBudgetAdvertise.gera:String;
begin
  FPagina.HTML.Clear;
  FPagina.HTML.Add('<div id="content">');
  FPagina.HTML.Add(Header);
  FPagina.HTML.Add(Body);
  FPagina.HTML.Add('</div>');
  FPagina.HTML.SaveToFile('d:\desktop\pagina.html');

end;

function  TReportBudgetAdvertise.LinhaImparImp:String;
begin
  Result := concat(
               '<div class="rowOdd"> ',
               ' <div class="columFirst">1 </div> ',
               ' <div class="ColumnEsp" style=''width:18%''>CIDADE</div> ',
               ' <div class="ColumnEsp" style=''width:14%''>JORNAL</div> ',
               ' <div class="ColumnEsp" style=''width:7%''>TIRAGEM</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>CM/COL</div> ',
               ' <div class="ColumnEsp" style=''width:10%''>FORMATO</div> ',
               ' <div class="ColumnEsp" style=''width:10%''>MEDIDA</div> ',
               ' <div class="ColumnEsp" style=''width:5%''>COL</div> ',
               ' <div class="ColumnEsp" style=''width:5%''>ALT</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>UNITÁRIO</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>INSERÇÕES</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>TOTAL</div> ',
               '</div> '
  );
end;

function  TReportBudgetAdvertise.LinhaParImp:String;
begin
  result := concat(
               '<div class="rowPair"> ',
               ' <div class="columFirst">2 </div> ',
               ' <div class="ColumnEsp" style=''width:18%''>CIDADE</div> ',
               ' <div class="ColumnEsp" style=''width:14%''>JORNAL</div> ',
               ' <div class="ColumnEsp" style=''width:7%''>TIRAGEM</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>CM/COL</div> ',
               ' <div class="ColumnEsp" style=''width:10%''>FORMATO</div> ',
               ' <div class="ColumnEsp" style=''width:10%''>MEDIDA</div> ',
               ' <div class="ColumnEsp" style=''width:5%''>COL</div> ',
               ' <div class="ColumnEsp" style=''width:5%''>ALT</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>UNITÁRIO</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>INSERÇÕES</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>TOTAL</div> ',
               '</div> '
  );
end;

function TReportBudgetAdvertise.base64_encoding(FileNAme: String): String;
var
  stream: TFileStream;
  base64: TIdEncoderMIME;
  output: string;
begin
  if (FileExists(FileName)) then
  begin
    try
      begin
        base64 := TIdEncoderMIME.Create(nil);
        stream := TFileStream.Create(FileName, fmOpenRead);
        output := TIdEncoderMIME.EncodeStream(stream);
        stream.Free;
        base64.Free;
        if not(output = '') then
        begin
          Result := output;
        end
        else
        begin
          Result := 'Error';
        end;
      end;
    except
      begin
        Result := 'Error'
      end;
    end;
  end
  else
  begin
    Result := 'Error'
  end;
end;


function TReportBudgetAdvertise.Body:String;
begin
  FPagina.HTML.Add('<div>');
  FPagina.HTML.Add(Cabecalho);
  FPagina.HTML.Add(Titulo);
  FPagina.HTML.Add(grupoImp);
  FPagina.HTML.Add(LinhaImparImp);
  FPagina.HTML.Add(LinhaParImp);
  FPagina.HTML.Add('</div>');

end;

function TReportBudgetAdvertise.Cabecalho:String;
begin
  REsult := concat(
          '<div class="rowEsp"> ',
          '  <div class="columnEsp" style=''width:70%''> ',
          '<img src="data:image/png;base64,',base64_encoding('D:\Desktop\logo_merconeti.png'),'" height="83px"> ',
          '  </div> ',
          '  <div class="columnEsp" style=''width:30%'' > ',
          '    <div class="tittletime" > ',
          '    SIMULAÇÃO 001/2020 <br> ',
          '    DATA 16/08/2020 ',
          '    </div> ',
          '  </div> ',
          '</div> '
  );
end;

constructor TReportBudgetAdvertise.Create;
begin

end;

destructor TReportBudgetAdvertise.Destroy;
begin

end;

function TReportBudgetAdvertise.grupoImp:String;
begin
  Result := concat(
               '<div class="group" > ',
               ' <div class="ColumnEsp" style=''width:17pt''> </div> ',
               ' <div class="ColumnEsp" style=''width:18%''>CIDADE</div> ',
               ' <div class="ColumnEsp" style=''width:14%''>JORNAL</div> ',
               ' <div class="ColumnEsp" style=''width:7%''>TIRAGEM</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>CM/COL</div> ',
               ' <div class="ColumnEsp" style=''width:10%''>FORMATO</div> ',
               ' <div class="ColumnEsp" style=''width:10%''>MEDIDA</div> ',
               ' <div class="ColumnEsp" style=''width:5%''>COL</div> ',
               ' <div class="ColumnEsp" style=''width:5%''>ALT</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>UNITÁRIO</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>INSERÇÕES</div> ',
               ' <div class="ColumnEsp" style=''width:8%''>TOTAL</div> ',
               '</div>'
  );
end;

function TReportBudgetAdvertise.Header:String;
begin
  FPagina.HTML.Add(ScriptCode);
  FPagina.HTML.Add(Style);
end;

function TReportBudgetAdvertise.ScriptCode: String;
begin
  REsult := concat(
              '<script>',
              'var doc = new jsPDF(''l'', ''mm'', [297, 210]);',
              '  doc.addHTML(document.getElementById("content"),function() {',
              '      doc.save(''cotacao.pdf'');',
              '});',
              '</script>'
  );
end;


procedure TReportBudgetAdvertise.setFPagina(const Value: TUnimHTMLFrame);
begin
  Fpagina := Value;
end;

function TReportBudgetAdvertise.Style:String;
begin
  Result := concat(
            '<style>',
            'img{',
            '  padding :5px;',
            '  margin-bottom:10px;',
            '}',
            '.RowEsp {',
            '    display: table;',
            '}',
            '.ColumnEsp {',
            '    display: table-cell;',
            '}',
            '.group{',
            '  display: table;',
            '  color:white;',
            '  font-size:11.0pt;',
            '  font-weight:700;',
            '  font-family:Calibri, sans-serif;',
            '  text-align:center;',
            '  background:#305496;',
            '}',
            '.columFirst{',
            '  display: table;',
            '  color:white;',
            '  font-size:11.0pt;',
            '  font-weight:700;',
            '  font-family:Calibri, sans-serif;',
            '  text-align:center;',
            '  background:#8EA9DB;',
            '  height:14.4pt;',
            '  width:17pt;',
            '}',
            '.rowPair{',
            '    display: table;',
            '  color:black;',
            '  font-size:11.0pt;',
            '  font-weight:400;',
            '  font-style:normal;',
            '  font-family:Calibri, sans-serif;',
            '  background:#F2F2F2;',
            '}',
            '.rowOdd{',
            '    display: table;',
            '  color:black;',
            '  font-size:11.0pt;',
            '  font-weight:400;',
            '  font-style:normal;',
            '  font-family:Calibri, sans-serif;',
            '}',
            '.tittlegroup{',
            '  width:1288;',
            '  font-size:14.0pt;',
            '  font-weight:700;',
            '  font-family:Calibri, sans-serif;',
            '  text-align:left;',
            '  margin-bottom:5px;',
            '}',
            '.tittletime{',
            '  position:absolute;',
            '  top:0;',
            '  padding :20px;',
            '  margin-bottom:10px;',
            '  text-align:right;',
            '  width:100%;',
            '}',
            '</style>'
  );
end;

function TReportBudgetAdvertise.Titulo:String;
begin
  REsult := concat(
            '<div class="tittlegroup" > ',
            '  IMPRESSO COR / NOTICIÁRIO / VALIDADE 30 DIAS ',
            '</div> '
  );
end;

end.
