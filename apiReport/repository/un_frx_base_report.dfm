object FrxBaseReport: TFrxBaseReport
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Geral'
  ClientHeight = 195
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object frxBase: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43076.475621412000000000
    ReportOptions.LastChange = 43495.657906400460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      'end.')
    OnStartReport = 'frxBaseOnStartReport'
    Left = 32
    Top = 16
    Datasets = <
      item
        DataSet = frxDBaseReport
        DataSetName = 'frxDBaseReport'
      end>
    Variables = <
      item
        Name = ' CabecalhoEmpresa'
        Value = Null
      end
      item
        Name = 'NomeFantasia'
        Value = Null
      end
      item
        Name = 'DocFiscal'
        Value = Null
      end
      item
        Name = 'Endereco'
        Value = Null
      end
      item
        Name = 'Fones'
        Value = Null
      end
      item
        Name = 'email'
        Value = Null
      end
      item
        Name = 'website'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = Null
      end
      item
        Name = ' Footer'
        Value = Null
      end
      item
        Name = 'SumProduct'
        Value = Null
      end
      item
        Name = 'SumService'
        Value = Null
      end
      item
        Name = ' General'
        Value = Null
      end
      item
        Name = 'StrConnection'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 23.000000000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo39: TfrxMemoView
          Left = 150.000000000000000000
          Top = 2.000000000000000000
          Width = 136.031540000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[<Date>] -[<Time>]')
          ParentFont = False
          Formats = <
            item
              FormatStr = 'mm.dd.yyyy'
              Kind = fkDateTime
            end
            item
            end>
        end
        object Memo40: TfrxMemoView
          Left = 665.503710000000000000
          Top = 2.220469999999999000
          Width = 45.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[<Page>]/[<TotalPages>]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 596.503710000000000000
          Top = 2.220469999999999000
          Width = 64.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pagina N'#186)
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 4.000000000000000000
          Top = 2.000000000000000000
          Width = 139.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio emitido em:')
          ParentFont = False
        end
      end
    end
  end
  object frxDBaseReport: TfrxDBDataset
    UserName = 'frxDBaseReport'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 112
    Top = 16
  end
  object Qry: TFDQuery
    Filtered = True
    SQL.Strings = (
      '       Select distinct sl.id, sl.description, sl.kind'
      '       from tb_stock_list sl ')
    Left = 200
    Top = 16
  end
  object frxPDF: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 24
    Top = 72
  end
end
