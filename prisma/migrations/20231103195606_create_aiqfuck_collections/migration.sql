-- CreateTable
CREATE TABLE "client" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45),
    "idade" VARCHAR(45),
    "phone" VARCHAR(45),
    "cpf" VARCHAR(45),
    "type_user" CHAR(1),
    "genero_id" INTEGER NOT NULL,
    "login_id" INTEGER NOT NULL,

    CONSTRAINT "PK_client" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "genero" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45),

    CONSTRAINT "PK_genero" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "login" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45),
    "logincol" VARCHAR(45),
    "email" VARCHAR(45),
    "passwd" VARCHAR(45),
    "photo" VARCHAR(500),
    "created_at" TIMESTAMP(6),
    "updated_at" TIMESTAMP(6),

    CONSTRAINT "PK_login" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sex_worker" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45),
    "idade" VARCHAR(45),
    "genero_id" INTEGER NOT NULL,

    CONSTRAINT "PK_sex_worker" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sex_worker_address" (
    "id" SERIAL NOT NULL,
    "address_name" VARCHAR(45),
    "address_number" VARCHAR(45),
    "address_city" VARCHAR(45),
    "address_state" VARCHAR(45),
    "address_padrao" CHAR(1),
    "sex_worker_id" INTEGER NOT NULL,

    CONSTRAINT "PK_sex_worker_address" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sex_worker_address_has_sex_worker_service" (
    "sex_worker_address_id" INTEGER NOT NULL,
    "sex_worker_service_id" INTEGER NOT NULL,

    CONSTRAINT "PK_sex_worker_address_has_sex_worker_service" PRIMARY KEY ("sex_worker_address_id","sex_worker_service_id")
);

-- CreateTable
CREATE TABLE "sex_worker_contact" (
    "id" SERIAL NOT NULL,
    "fone" VARCHAR(45),
    "email" VARCHAR(45),
    "city" VARCHAR(45),
    "sex_worker_id" INTEGER NOT NULL,

    CONSTRAINT "PK_sex_worker_contact" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sex_worker_galery" (
    "id" SERIAL NOT NULL,
    "photo" VARCHAR(200),
    "title" VARCHAR(45),
    "description" VARCHAR(45),
    "sex_worker_id" INTEGER NOT NULL,

    CONSTRAINT "PK_sex_worker_galery" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sex_worker_service" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(45),
    "preco" DECIMAL(10,2),
    "sex_worker_id" INTEGER NOT NULL,

    CONSTRAINT "PK_sex_worker_service" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "fk_Client_genero1_idx" ON "client"("genero_id");

-- CreateIndex
CREATE INDEX "fk_Client_login1_idx" ON "client"("login_id");

-- CreateIndex
CREATE INDEX "fk_sex_worker_genero_idx" ON "sex_worker"("genero_id");

-- CreateIndex
CREATE INDEX "fk_sex_worker_address_sex_worker1_idx" ON "sex_worker_address"("sex_worker_id");

-- CreateIndex
CREATE INDEX "fk_sex_worker_address_has_sex_worker_service_sex_worker_add_idx" ON "sex_worker_address_has_sex_worker_service"("sex_worker_address_id");

-- CreateIndex
CREATE INDEX "fk_sex_worker_address_has_sex_worker_service_sex_worker_ser_idx" ON "sex_worker_address_has_sex_worker_service"("sex_worker_service_id");

-- CreateIndex
CREATE INDEX "fk_sex_worker_contact_sex_worker1_idx" ON "sex_worker_contact"("sex_worker_id");

-- CreateIndex
CREATE INDEX "fk_sex_worker_galery_sex_worker1_idx" ON "sex_worker_galery"("sex_worker_id");

-- CreateIndex
CREATE INDEX "fk_sex_worker_service_sex_worker1_idx" ON "sex_worker_service"("sex_worker_id");

-- AddForeignKey
ALTER TABLE "client" ADD CONSTRAINT "fk_Client_genero1" FOREIGN KEY ("genero_id") REFERENCES "genero"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "client" ADD CONSTRAINT "fk_Client_login1" FOREIGN KEY ("login_id") REFERENCES "login"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sex_worker" ADD CONSTRAINT "fk_sex_worker_genero" FOREIGN KEY ("genero_id") REFERENCES "genero"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sex_worker_address" ADD CONSTRAINT "fk_sex_worker_address_sex_worker1" FOREIGN KEY ("sex_worker_id") REFERENCES "sex_worker"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sex_worker_address_has_sex_worker_service" ADD CONSTRAINT "fk_sex_worker_address_has_sex_worker_service_sex_worker_addre1" FOREIGN KEY ("sex_worker_address_id") REFERENCES "sex_worker_address"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sex_worker_address_has_sex_worker_service" ADD CONSTRAINT "fk_sex_worker_address_has_sex_worker_service_sex_worker_servi1" FOREIGN KEY ("sex_worker_service_id") REFERENCES "sex_worker_service"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sex_worker_contact" ADD CONSTRAINT "fk_sex_worker_contact_sex_worker1" FOREIGN KEY ("sex_worker_id") REFERENCES "sex_worker"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sex_worker_galery" ADD CONSTRAINT "fk_sex_worker_galery_sex_worker1" FOREIGN KEY ("sex_worker_id") REFERENCES "sex_worker"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sex_worker_service" ADD CONSTRAINT "fk_sex_worker_service_sex_worker1" FOREIGN KEY ("sex_worker_id") REFERENCES "sex_worker"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
