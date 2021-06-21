inherited FrxReportFinancialManager: TFrxReportFinancialManager
  Caption = 'FrxReportFinancialManager'
  ClientHeight = 178
  ClientWidth = 299
  ExplicitWidth = 315
  ExplicitHeight = 217
  PixelsPerInch = 96
  TextHeight = 13
  inherited frxBase: TfrxReport
    ReportOptions.LastChange = 43391.741181342590000000
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
        Value = ''
      end>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageFooter1: TfrxPageFooter
        Top = 336.378170000000000000
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
            end
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
            end
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
            end
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
            end
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
            end
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
            end
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
            end
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
            end
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
            end
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
            end
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
            end
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
            end
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
            end
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
            end
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
            end
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
          Top = 2.220469999999978000
          Memo.UTF8W = (
            '[Page]')
        end
        inherited Memo41: TfrxMemoView
          Left = 585.165120000000000000
          Top = 2.220469999999978000
          Width = 75.338590000000000000
          Memo.UTF8W = (
            'Pagina N'#186)
        end
        inherited Memo42: TfrxMemoView
          Top = 2.000000000000057000
          Memo.UTF8W = (
            'Relat'#243'rio emitido em:')
        end
      end
      inherited PageHeader1: TfrxPageHeader
        inherited lbTitulo: TfrxMemoView
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
          Top = 57.000000000000000000
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
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBaseReport
        DataSetName = 'frxDBaseReport'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.889763780000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[frxDBaseReport."posit_level"]')
        end
        object Memo2: TfrxMemoView
          Left = 102.267780000000000000
          Top = 1.889763779527556000
          Width = 317.480520000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[frxDBaseReport."description"]')
        end
        object E_total_value: TfrxMemoView
          Left = 619.464566930000000000
          Top = 1.889763779527556000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = frxDBaseReport
          DataSetName = 'frxDBaseReport'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBaseReport."total_value"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 521.952755910000000000
          Top = 1.889763779527556000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataSet = frxDBaseReport
          DataSetName = 'frxDBaseReport'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBaseReport."vl_debit"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 423.685039370000000000
          Top = 1.889763779527556000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'vl_credit'
          DataSet = frxDBaseReport
          DataSetName = 'frxDBaseReport'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBaseReport."vl_credit"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        Condition = 'Copy(<frxDBaseReport."posit_level">,1,1)'
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.999995119999994100
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Plano Contas')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 103.165430000000000000
          Top = 0.999995119999994100
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o da Conta')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 619.464566930000000000
          Top = 0.999995119999994100
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Saldo')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 521.952755910000000000
          Top = 1.779529999999994000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'D'#233'bito')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 423.685039370000000000
          Top = 2.220470000000006000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Credito')
          ParentFont = False
        end
      end
    end
  end
  inherited frxDBaseReport: TfrxDBDataset
    DataSet = cds_qry
  end
  inherited Qry: TFDQuery
    SQL.Strings = (
      
        'select pl.posit_level, pl.description, pl.source_, sum(fs.credit' +
        '_value) vl_credit, sum(fs.debit_value ) vl_debit, sum(fs.credit_' +
        'value - fs.debit_value ) total_value'
      'from tb_financial_plans pl'
      '  left join tb_financial_statement fs'
      '  on (fs.tb_financial_plans_id_deb = pl.id)'
      
        'where pl.source_ = '#39'D'#39' and pl.kind = '#39'C'#39'  and (fs.dt_record is n' +
        'ull or  fs.dt_record = '#39'07/01/2018'#39')'
      ''
      'group by 1,2,3'
      'union'
      
        'select pl.posit_level, pl.description, pl.source_, sum(fs.credit' +
        '_value) vl_credit, sum(fs.debit_value ) vl_debit, sum(fs.credit_' +
        'value - fs.debit_value ) total_value'
      'from tb_financial_plans pl'
      '  left join tb_financial_statement fs'
      '  on (fs.tb_financial_plans_id_deb = pl.id)'
      
        'where pl.source_ = '#39'C'#39' and pl.kind = '#39'C'#39'  and (fs.dt_record is n' +
        'ull or  fs.dt_record = '#39'07/01/2018'#39')'
      ''
      'group by 1,2,3'
      'UNION'
      ''
      
        'select pl.posit_level, pl.description, pl.source_, sum(fs.credit' +
        '_value) vl_credit, sum(fs.debit_value ) vl_debit, sum(fs.credit_' +
        'value - fs.debit_value ) total_value'
      'from tb_financial_plans pl'
      '  left join tb_financial_statement fs'
      '  on (fs.tb_financial_plans_id_cre = pl.id)'
      ''
      
        'where pl.source_ = '#39'D'#39' and pl.kind = '#39'R'#39'  and (fs.dt_record is n' +
        'ull or  fs.dt_record = '#39'07/01/2018'#39')'
      'group by 1,2,3'
      'order by 1')
  end
  object cds_qry: TClientDataSet [3]
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 80
    object cds_qryposit_level: TStringField
      FieldName = 'posit_level'
      Size = 50
    end
    object cds_qrydescription: TStringField
      FieldName = 'description'
      Size = 100
    end
    object cds_qrysource_: TStringField
      FieldName = 'source_'
      Size = 1
    end
    object cds_qrycluster: TStringField
      FieldName = 'cluster'
      Size = 1
    end
    object cds_qryvl_credit: TFloatField
      FieldName = 'vl_credit'
    end
    object cds_qryvl_debit: TFloatField
      FieldName = 'vl_debit'
    end
    object cds_qrytotal_value: TFloatField
      FieldName = 'total_value'
    end
  end
  object Qr_Real: TFDQuery [4]
    Filtered = True
    SQL.Strings = (
      
        'select pl.posit_level, pl.description, pl.source_, sum(fs.credit' +
        '_value) vl_credit, sum(fs.debit_value ) vl_debit, sum(fs.credit_' +
        'value - fs.debit_value ) total_value'
      'from tb_financial_plans pl'
      '  left join tb_financial_statement fs'
      '  on (fs.tb_financial_plans_id_deb = pl.id)'
      
        'where pl.source_ = '#39'D'#39' and pl.kind = '#39'C'#39'  and (fs.dt_record is n' +
        'ull or  fs.dt_record = '#39'07/01/2018'#39')'
      ''
      'group by 1,2,3'
      'union'
      
        'select pl.posit_level, pl.description, pl.source_, sum(fs.credit' +
        '_value) vl_credit, sum(fs.debit_value ) vl_debit, sum(fs.credit_' +
        'value - fs.debit_value ) total_value'
      'from tb_financial_plans pl'
      '  left join tb_financial_statement fs'
      '  on (fs.tb_financial_plans_id_deb = pl.id)'
      
        'where pl.source_ = '#39'C'#39' and pl.kind = '#39'C'#39'  and (fs.dt_record is n' +
        'ull or  fs.dt_record = '#39'07/01/2018'#39')'
      ''
      'group by 1,2,3'
      'UNION'
      ''
      
        'select pl.posit_level, pl.description, pl.source_, sum(fs.credit' +
        '_value) vl_credit, sum(fs.debit_value ) vl_debit, sum(fs.credit_' +
        'value - fs.debit_value ) total_value'
      'from tb_financial_plans pl'
      '  left join tb_financial_statement fs'
      '  on (fs.tb_financial_plans_id_cre = pl.id)'
      ''
      
        'where pl.source_ = '#39'D'#39' and pl.kind = '#39'R'#39'  and (fs.dt_record is n' +
        'ull or  fs.dt_record = '#39'07/01/2018'#39')'
      'group by 1,2,3'
      'order by 1')
    Left = 248
    Top = 16
  end
end
