inherited FrxBudAdvertise: TFrxBudAdvertise
  Caption = 'FrxBudAdvertise'
  PixelsPerInch = 96
  TextHeight = 13
  inherited frxBase: TfrxReport
    ReportOptions.LastChange = 44060.868476504630000000
    ScriptText.Strings = (
      ''
      ''
      'begin'
      'end.')
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
        Value = Null
      end>
    Style = <>
    inherited Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      inherited PageFooter1: TfrxPageFooter
        Top = 291.023810000000000000
        Width = 1046.929810000000000000
        inherited Memo39: TfrxMemoView
          Memo.UTF8W = (
            '[<Date>] -[<Time>]')
          Formats = <
            item
              FormatStr = 'mm.dd.yyyy'
              Kind = fkDateTime
            end
            item
            end
            item
              FormatStr = 'mm.dd.yyyy'
              Kind = fkDateTime
            end
            item
            end>
        end
        inherited Memo40: TfrxMemoView
          Left = 998.102350000000000000
          Top = 2.220469999999980000
          Memo.UTF8W = (
            '[<Page>]/[<TotalPages>]')
        end
        inherited Memo41: TfrxMemoView
          Left = 929.102350000000000000
          Top = 2.220469999999980000
          Memo.UTF8W = (
            'Pagina N'#186)
        end
        inherited Memo42: TfrxMemoView
          Top = 2.000000000000060000
          Memo.UTF8W = (
            'Relat'#243'rio emitido em:')
        end
      end
      inherited PageHeader1: TfrxPageHeader
        Width = 1046.929810000000000000
        inherited lbTitulo: TfrxMemoView
          Width = 1046.929810000000000000
          Memo.UTF8W = (
            '[Titulo]')
        end
        inherited lbDocFiscal: TfrxMemoView
          Memo.UTF8W = (
            '[DocFiscal]')
        end
        inherited lbEndereco: TfrxMemoView
          Memo.UTF8W = (
            '[Endereco]')
        end
        inherited lbFones: TfrxMemoView
          Memo.UTF8W = (
            '[Fones]')
        end
        inherited lbWebSites: TfrxMemoView
          Memo.UTF8W = (
            '[website]')
        end
        inherited lbemail: TfrxMemoView
          Memo.UTF8W = (
            '[email]')
        end
        inherited lbNomeFantasia: TfrxMemoView
          Memo.UTF8W = (
            '[NomeFantasia]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 207.874150000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBaseReport
        DataSetName = 'frxDBaseReport'
        RowCount = 0
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 1054.488870000000000000
          Height = 18.897650000000000000
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line#> mod 2) = 0'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = cl3DLight
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'name'
          DataSet = frxDBaseReport
          DataSetName = 'frxDBaseReport'
          Memo.UTF8W = (
            '[frxDBaseReport."name"]')
        end
        object Memo2: TfrxMemoView
          Left = 109.606370000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'link'
          DataSet = frxDBaseReport
          DataSetName = 'frxDBaseReport'
          Memo.UTF8W = (
            '[frxDBaseReport."link"]')
        end
        object Memo3: TfrxMemoView
          Left = 215.433210000000000000
          Top = 3.779529999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'formats'
          DataSet = frxDBaseReport
          DataSetName = 'frxDBaseReport'
          Memo.UTF8W = (
            '[frxDBaseReport."formats"]')
        end
        object Memo4: TfrxMemoView
          Left = 313.700990000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'days'
          DataSet = frxDBaseReport
          DataSetName = 'frxDBaseReport'
          Memo.UTF8W = (
            '[frxDBaseReport."days"]')
        end
        object Memo5: TfrxMemoView
          Left = 411.968770000000000000
          Top = 3.779529999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'page_views'
          DataSet = frxDBaseReport
          DataSetName = 'frxDBaseReport'
          Memo.UTF8W = (
            '[frxDBaseReport."page_views"]')
        end
        object Memo6: TfrxMemoView
          Left = 510.236550000000000000
          Top = 3.779530000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'unit_value'
          DataSet = frxDBaseReport
          DataSetName = 'frxDBaseReport'
          Memo.UTF8W = (
            '[frxDBaseReport."unit_value"]')
        end
      end
    end
  end
  inherited frxDBaseReport: TfrxDBDataset
    DataSet = Qry
  end
  inherited Qry: TFDQuery
    Connection = SC.TesteDB
    SQL.Strings = (
      
        'select c.name,  sm.link ,baw.formats, baw.days, baw.page_views, ' +
        'baw.unit_value'
      'from tb_budg_advertise_web baw '
      'inner join tb_med_price_list_ol pol '
      'on (baw.tb_med_price_list_ol_id = pol.id) '
      '  and (baw.tb_institution_id = pol.tb_institution_id) '
      '    and (baw.tb_broadcaster_id = pol.tb_broadcaster_id) '
      '  inner join tb_broadcaster b '
      '  on (baw.tb_broadcaster_id = b.id) '
      '  inner join tb_entity e '
      '  on (e.id = b.id) '
      '  inner join tb_address adr '
      '  on (adr.id = b.id) '
      '  inner join tb_city c '
      '  on (c.id =adr.tb_city_id) '
      '  left outer join tb_social_media sm'
      '  on (sm.id = e.id)  and (sm.kind = '#39'wwww'#39') '
      'where pol.online_price >0  ')
  end
  object frxReport: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43076.475621412000000000
    ReportOptions.LastChange = 44060.888162812500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      'end.')
    OnStartReport = 'frxBaseOnStartReport'
    Left = 120
    Top = 88
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
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
end
