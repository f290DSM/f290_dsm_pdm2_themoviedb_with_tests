class Evento {
  int? id;
  Artefato? artefato;
  Corpo? corpo;
  String? criadoEm;
  String? atualizadoEm;

  Evento(
      {this.id, this.artefato, this.corpo, this.criadoEm, this.atualizadoEm});

  Evento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    artefato =
        json['artefato'] != null ? Artefato.fromJson(json['artefato']) : null;
    corpo = json['corpo'] != null ? Corpo.fromJson(json['corpo']) : null;
    criadoEm = json['criado_em'];
    atualizadoEm = json['atualizado_em'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (artefato != null) {
      data['artefato'] = artefato!.toJson();
    }
    if (corpo != null) {
      data['corpo'] = corpo!.toJson();
    }
    data['criado_em'] = criadoEm;
    data['atualizado_em'] = atualizadoEm;
    return data;
  }
}

class Artefato {
  int? id;
  TipoArtefato? tipoArtefato;
  Entidade? entidade;
  bool? ativo;
  String? descricao;
  Comportamentos? comportamentos;
  String? criadoEm;
  String? atualizadoEm;

  Artefato(
      {this.id,
      this.tipoArtefato,
      this.entidade,
      this.ativo,
      this.descricao,
      this.comportamentos,
      this.criadoEm,
      this.atualizadoEm});

  Artefato.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipoArtefato = json['tipo_artefato'] != null
        ? TipoArtefato.fromJson(json['tipo_artefato'])
        : null;
    entidade =
        json['entidade'] != null ? Entidade.fromJson(json['entidade']) : null;
    ativo = json['ativo'];
    descricao = json['descricao'];
    comportamentos = json['comportamentos'] != null
        ? Comportamentos.fromJson(json['comportamentos'])
        : null;
    criadoEm = json['criado_em'];
    atualizadoEm = json['atualizado_em'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (tipoArtefato != null) {
      data['tipo_artefato'] = tipoArtefato!.toJson();
    }
    if (entidade != null) {
      data['entidade'] = entidade!.toJson();
    }
    data['ativo'] = ativo;
    data['descricao'] = descricao;
    if (comportamentos != null) {
      data['comportamentos'] = comportamentos!.toJson();
    }
    data['criado_em'] = criadoEm;
    data['atualizado_em'] = atualizadoEm;
    return data;
  }
}

class TipoArtefato {
  int? id;
  String? descricao;
  bool? produtor;
  String? criadoEm;
  String? atualizadoEm;

  TipoArtefato(
      {this.id,
      this.descricao,
      this.produtor,
      this.criadoEm,
      this.atualizadoEm});

  TipoArtefato.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    produtor = json['produtor'];
    criadoEm = json['criado_em'];
    atualizadoEm = json['atualizado_em'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['descricao'] = descricao;
    data['produtor'] = produtor;
    data['criado_em'] = criadoEm;
    data['atualizado_em'] = atualizadoEm;
    return data;
  }
}

class Entidade {
  int? id;
  TipoEntidade? tipoEntidade;
  String? descricao;
  String? cep;
  String? complemento;
  String? bairro;
  String? endereco;
  String? cidade;
  String? estado;
  String? criadoEm;
  String? atualizadoEm;

  Entidade(
      {this.id,
      this.tipoEntidade,
      this.descricao,
      this.cep,
      this.complemento,
      this.bairro,
      this.endereco,
      this.cidade,
      this.estado,
      this.criadoEm,
      this.atualizadoEm});

  Entidade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipoEntidade = json['tipo_entidade'] != null
        ? TipoEntidade.fromJson(json['tipo_entidade'])
        : null;
    descricao = json['descricao'];
    cep = json['cep'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    endereco = json['endereco'];
    cidade = json['cidade'];
    estado = json['estado'];
    criadoEm = json['criado_em'];
    atualizadoEm = json['atualizado_em'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (tipoEntidade != null) {
      data['tipo_entidade'] = tipoEntidade!.toJson();
    }
    data['descricao'] = descricao;
    data['cep'] = cep;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['endereco'] = endereco;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['criado_em'] = criadoEm;
    data['atualizado_em'] = atualizadoEm;
    return data;
  }
}

class TipoEntidade {
  int? id;
  String? descricao;
  String? criadoEm;
  String? atualizadoEm;

  TipoEntidade({this.id, this.descricao, this.criadoEm, this.atualizadoEm});

  TipoEntidade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    criadoEm = json['criado_em'];
    atualizadoEm = json['atualizado_em'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['descricao'] = descricao;
    data['criado_em'] = criadoEm;
    data['atualizado_em'] = atualizadoEm;
    return data;
  }
}

class Comportamentos {
  Comportamentos.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Corpo {
  String? estado;

  Corpo({this.estado});

  Corpo.fromJson(Map<String, dynamic> json) {
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['estado'] = estado;
    return data;
  }
}
