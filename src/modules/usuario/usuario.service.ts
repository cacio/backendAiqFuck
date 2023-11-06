import { Injectable } from '@nestjs/common';
import { UsuarioDTO } from './usuario.dto';
import { PrismaService } from 'src/datrabase/PrismaService';

@Injectable()
export class UsuarioService {

    constructor(private prisma:PrismaService){}

    async create(data:UsuarioDTO){

        const userExists = await this.prisma.login.findFirst({
            where:{
                email: data.email
            }
        });

        if(userExists){
            throw new Error("Usuario ja exite");
        }

       const user = await this.prisma.login.create({
            data,
        });

        return user;
    }
}
